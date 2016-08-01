---
layout: page
title: Contribute
---

The FirewallD project uses github for tracking issues and the overall development process. If you’d like to report a bug you found in any of the components, request a feature to be implemented (or included if you already have a patch) or just to track the progress, direct your browser to:

[https://github.com/t-woerner/firewalld](https://github.com/t-woerner/firewalld)

FirewallD is licensed under the GPLv2. By submitting a patch for inclusion, you are agreeing to license your changes under the GPLv2.

Changes to the repository can be submitted by sending patches to the firewalld-devel mailing list, attaching patches to Trac tickets. The preferred way to prepare the patch is to get fresh copy of git repository:

    $ git clone https://github.com/t-woerner/firewalld.git

Commit the change locally and use:

    $ git-format-patch -1 commit-id

To export the patch. commit-id is the commit number of the checkin you want to send (use ‘git log’ to see it).

Commit message requirements, please state:

    What changed
    Why it changed.

## List of contributors

[https://github.com/t-woerner/firewalld/graphs/contributors](https://github.com/t-woerner/firewalld/graphs/contributors)
