---
layout: post
title: "libnftables JSON"
section: Blog
date: 2019-09-13T09:00:00
author: Eric Garver
category: feature
---

# libnftables JSON

A future firewalld feature release (0.8.0) will contain a significant change to
the nftables backend. In the past firewalld has always called the `nft` binary.
As of git commit
[1582c5dd736a](https://github.com/firewalld/firewalld/commit/1582c5dd736a11177ec320eb4ecbeb09fcae313a)
firewalld will instead use the `libnftables` library. This is the same library
that nft uses internally. All the communication with the library is a through
a thin python wrapper and uses structured JSON. This means firewalld never
calls the nft binary.

## Why it's good

Outside of using structured JSON there are a couple other advantages:

* faster rule application  
  firewalld used to make a call to nft for _every_ rule. With libnftables
  it's now passing large blobs of JSON that can contain hundreds of rules. This
  reduces the numbers of round trips to the kernel and yields a significant
  performance improvement.
* no fork()ing  
  Each call to nft would be a matter of forking a new process and waiting on
  the result. With libnftables there is no more forking.
* atomic transactions  
  Internally firewalld builds a set of changes and attempts to apply them all
  at once. The old nft backend still had to call nft once for every rule so
  this transaction wasn't atomic and there were small periods of time between
  the rules being applied. This time frame is small, but can cause [real
  issues](https://bugzilla.redhat.com/show_bug.cgi?id=1663588) in some
  scenarios. With libnftables the rules are applied in an "all or nothing"
  manner. Either they all take effect at once or not at all.

## What it looks like

From the user's perspective nothing has changed. With the exception that
firewalld now has a new dependency.

From a developer's point of view rule generation looks quite different. Instead
of building strings that are identical to the nft CLI firewalld needs to
generate a python dictionary containing other dictionaries and lists. This will
then be converted to JSON before being passed to libnftables.

For example the following is an example rule from before libnftables.

```python
"add rule inet %s filter_%s ct state established,related accept" % (TABLE_NAME, "INPUT"))
```

And here is the equivalent python dictionary.

```python
{"add": {"rule":  {"family": "inet",
                   "table": TABLE_NAME,
                   "chain": "filter_%s" % "INPUT",
                   "expr": [{"match": {"left": {"ct": {"key": "state"}},
                                       "op": "in",
                                       "right": {"set": ["established", "related"]}}},
                            {"accept": None}]}}}
```

It's a definitely more verbose, but the nested dictionaries are easier to work
with.

You can learn more about libnftables JSON by reading the man page
`libnftables-json(5)`. It covers the basics and the full syntax.

## python-nftables

As briefly mentioned above, firewalld uses a thin python wrapper around
libnftables. This is shipped with the nftables package and is being referred to
as `python-nftables` by the firewalld developers.

## Requirements

Short answer: `nftables >= 0.9.3`

Long answer:

With this change firewalld has new dependencies; `libnftables`, and
`python-nftables`. Currently both libnftables and python-nftables are shipped
with the standard nftables package. Distribution packagers shouldn't have to
change much. It really amounts to calling the nftables configure script with
`--with-python --with-json`.

libnftables has been around for awhile, but due to bug fixes and other changes
the firewalld developers are claiming the libnftables backend only works with
`nftables >= 0.9.3`.
