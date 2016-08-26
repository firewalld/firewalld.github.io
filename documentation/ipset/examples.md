---
layout: page
title: "Examples"
---

Here are some example ipsets:

## white list

    <?xml version="1.0" encoding="utf-8"?>
      <ipset type="hash:net">
      <short>white-list</short>
      <entry>1.2.3.4</entry>
      <entry>1.2.3.5</entry>
      <entry>1.2.3.6</entry>
    </ipset>

## mac

    <?xml version="1.0" encoding="utf-8"?>
    <ipset type="hash:mac">
      <short>mac-list</short>
      <entry>00:11:22:33:44:55</entry>
    </ipset>
