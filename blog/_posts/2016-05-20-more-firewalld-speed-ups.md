---
layout: post
title: "More firewalld speed ups"
section: Blog
date: 2016-05-20T06:49:59
author: Thomas Woerner
---

Previously firewalld got a nice speed up by using the iptables restore commands, that made it possible to commit several changes at once. Now there is also a transaction model using these commands, which enables firewalld to apply lots of rules at once. For example to apply a single zone or also to apply the default rules and all zones while loading.

Here are some comparison numbers of the old firewalld version 0.3.9 in RHEl-7.2, the actual firewalld version 0.4.1.2 and the development version 0.4.2 that will be released soon.

<a href="{{ site.baseurl }}/uploads/2016/05/firewalld-benchmark.png" rel="attachment"><img class="aligncenter size-full" src="{{ site.baseurl }}/uploads/2016/05/firewalld-benchmark.png" alt="firewalld-benchmark" width="745" height="496" /></a>

The diagram shows the time that is needed to start firewalld with loading of all config files, applying all rules and the generation of the D-Bus interfaces.

Each of the zones has 5 interface bindings which are therefore active and also applied.

Here is the table with all numbers:

| Active zones	| 0.3.9 EL7       | 0.4.1.2 	   | pre 0.4.2     |
| ------------- | --------------- | -------------- | ------------- | 
| 0	 	| 317 - 1.32s     | 335 - 0.31s    | 335 - 0.18s   |
| 5	 	| 1037 - 5.59s    | 1055 - 1.53s   | 1055 - 0.19s  |
| 10		| 1757 - 11.69s   | 1775 - 3.11s   | 1775 - 0.24s  |
| 20		| 3197 - 27.00s	  | 3215 - 7.35s   | 3215 - 0.40s  |
| 30	 	| 4637 - 54.08s   | 4655 - 16.65s  | 4655 - 0.49s  |
| 50		| 7517 - 145.01s  | 7535 - 47.95s  | 7535 - 0.90s  |
| 100 		| 	    	  | 14735 - 298.34s | 14735 - 1.81s |
| 200 		| 	    	  |  	    	   | 29135 - 3.40s |
| 500 		| 	    	  | 	    	   | 72335 - 6.33s |
| 1000 		| 	    	  | 	    	   | 144335 - 13.35s |

The empty fields are not  bench marked anymore, because it will take too much time. The first number in the cells is the number of rules. Since firewalld version 0.4.1.2, there are some extra rules because of a better way to handle zones with accept, reject or drop targets.

The number of rules is gathered with the command
<pre> (iptables-save; ip6tables-save; ebtables-save) | wc -l</pre>
The firewalld start method has been extended with time callsin the beginning and the end to get the time difference.

The test are done on a Lenovo ThinkPad T510 with an i7M620 CPU and a normal HDD running RHEL-7.2. The ebtables package has been patched with the upstream <a href="http://git.netfilter.org/ebtables/commit/?id=3a25ae2361da048f24524d8e63d70f4cd40444f3">noflush patch for ebtables-restore</a>. Without this option firewalld will not use ebtables-restore. The tested firewalld version 0.4.1.2 additionally contains a <a href="https://github.com/firewalld/firewalld/commit/7dd6f72f26515d9b0ebab0c95628470a1caa8df8">fix for ebtables-restore usage</a>.
