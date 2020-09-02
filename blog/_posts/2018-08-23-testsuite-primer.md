---
layout: post
title: "Testsuite Primer"
section: Blog
date: 2018-08-23T12:00:00
author: Eric Garver
category: development
---

Over the past two major releases firewalld has seen vast improvements to its
testsuite. This post will discuss how to run the testsuite, how to debug a
failure, and finally we'll go through an exercise of adding a new test case.
The main target is for current and future contributors to firewalld. However,
since firewalld's testsuite utilizes autotest some of the knowledge gained here
may also carry over to other projects.

## Running the testsuite

Running the testsuite is very simple. To start build the code just as you would
if installing from source.

    $ git clone https://github.com/firewalld/firewalld
    $ cd firewalld
    $ ./autogen.sh
    $ ./configure
    $ make

Then run the testsuite using the `check` make target. This needs to be run as
`root`.

    # make check

These tests are non-destructive to the host running them and there is no need
to stop the host's running firewalld instance. They are run inside of network
namespaces (containers) which allows numerous benefits; reliability,
non-destructive to the host, and they can be run in parallel.

At the time of writing firewalld has 112 test groups - most of which include
multiple tests. As such, the testsuite takes a long time to run. The good news
is you can speed things up by running them in parallel.

To run test groups in parallel pass `-j4` to autotest via the `TESTSUITEFLAGS`
variable.

    # make check TESTSUITEFLAGS="-j4"

## Running the testsuite against the host installed firewalld

Firewalld's testsuite also provides an `installcheck` make target. This is
useful for running tests against the hosts *installed* version of firewalld.
The `check` target runs against the executables built in the *source tree*.
This is very important for development as it allows you to run a newer
testsuite against an older version of firewalld. As we'll find later on in this
post, this can be used to leverage test driven development.

To run the testsuite against the *installed* firewalld

    # make installcheck

## Debugging a failed test case

Inevitably a test will fail. Whether it's a bug in firewalld, a permission
issue, or a compatibility issue, you'll have to debug the problem. There are a
couple of ways to inspect a failure. The most straight forward way is to view
the testsuite log.

To view the testsuite log for failed test number 42

    # vi ./src/tests/testsuite.dir/042/testsuite.log

Alternatively, you can enable the verbose flag to cause the testsuite to dump
to standard output.

    # make check TESTSUITEFLAGS="42 -v"

To enable firewalld's debug output, you can use the `-d` flag.

    # make check TESTSUITEFLAGS="42 -v -d"

The test numbers passed to `TESTSUITEFLAGS` are very flexible. It will accept
individual numbers or ranges.

For example this is also valid

    # make check TESTSUITEFLAGS="42 1-5 110 13-14 17"

## Writing a new test case

In this example we'll follow a test driven development style to fix a real
world firewalld bug. We'll be using [Red Hat bugzilla 1404076](https://bugzilla.redhat.com/show_bug.cgi?id=1404076) for this
exercise. This bug occurs when a port range is opened using the `--add-port`
option. `--query-port` fails to return the expected result if querying a
single port within the range.

### Basic test layout

All of the tests follow the same basic layout. Since this is a new test case in
response to an existing bug we'll add it to the set of regression tests in
`src/tests/regression`.

At the absolute minimum your new test should look like this

    FWD_START_TEST([test description])

    ...
    FWD_CHECK([some command])
    ...

    FWD_END_TEST

The testsuite makes heavy use of m4 macros (`FWD_START_TEST`, `FWD_CHECK`,
etc.) to simplify test creation. m4 is a macro language which autotest uses to
generate the testsuite script.

A consequence of the macro magic is most tests will be run multiple times.
Once for each firewall backend; nftables and iptables. This ensures that both
backends are tested equally.

### The new test case

We start by creating a new test that reproduces the issue from the bugzilla
report.

Here is our new test case  
`src/tests/regression/rhbz1404076.at`:

    FWD_START_TEST([query single port added with range])
    
    dnl add a set of ports by range, then query a specific port inside that range.
    FWD_CHECK([-q --add-port=8080-8090/tcp])
    FWD_CHECK([-q --query-port=8085/tcp])
    FWD_CHECK([-q --query-port=webcache/tcp]) dnl named port
    FWD_CHECK([-q --query-port=8091/tcp], 1) dnl negative test
    FWD_CHECK([-q --query-port=8085/udp], 1) dnl negative test
    
    dnl same thing, but for permanent configuration.
    FWD_CHECK([-q --permanent --add-port=8080-8090/tcp])
    FWD_CHECK([-q --permanent --query-port=8085/tcp])
    FWD_CHECK([-q --permanent --query-port=webcache/tcp]) dnl named port
    FWD_CHECK([-q --permanent --query-port=8091/tcp], 1) dnl negative test
    FWD_CHECK([-q --permanent --query-port=8085/udp], 1) dnl negative test
    
    FWD_END_TEST

*Note*: `dnl` is m4's way of starting a comment.

This test is fairly exhaustive by including negative tests and named ports.
This gives us even more confidence in our code changes.

To attach the new test case to the testsuite we need to append the new test to
`src/tests/regression.at`.

    $ vi src/tests/regression.at
    [...]
    m4_include([regression/rhbz1404076.at])

This new test case can be found upstream on [github](https://github.com/firewalld/firewalld/commit/3fb707228ced1b45c059b8c745dac6482232b887).
The commit is `3fb707228ced ("tests/regression: add coverage for rhbz 1404076")`.

### Verifying the new test reproduces the issue

Now that the test has been added you can verify it reproduces the issue by
running it against the host's firewalld using the `installcheck` make target.

    # make installcheck
    [...]
    regression (nftables)
    
    [...]
     67: query single port added with range              FAILED (rhbz1404076.at:5)
    [...]
    regression (iptables)
    
    [..]
    110: query single port added with range              FAILED (rhbz1404076.at:5)

Here we see the test case failed as expected for both firewall backends.

### Fix the bug

The next step is to make code changes to fix the bug. This is out of scope for
this post, but for those interested the [fix can be found on github](https://github.com/firewalld/firewalld/commit/2925de324443eb4567c02d1608a256327e4f3fe3).
The commit is `2925de324443 ("ports: allow querying a single added by range")`.

### Verify the fix against the in-tree source code

Now that the test case has been written and code changes have been made we can
run the test case again, but this time against the *source tree* version. This
will verify our code changes fix the bug. Be sure to use the `check` make
target this time.

    # make check TESTSUITEFLAGS="67 110"

Once your new test case passes you should run the whole testsuite again to
verify you didn't introduce a regression.

    # make check

If that was successful, then you're ready to submit your changes upstream with
a [pull request](https://github.com/firewalld/firewalld/pulls)! Once your pull request is submitted the testsuite will
automatically be run again by travis-ci against multiple versions of python.

## Conclusions

This post has shown how easy it is to get started with the firewalld testsuite.
We hope it will encourage contributions from others while simultaneously
improving firewalld's quality. Additionally we hope it turns some users into
active contributors!
