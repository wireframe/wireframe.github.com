---
layout: post
title: "Ubiquity is Like Crack"
date: 2008-08-26
comments: false
tags:
 - ubiquity
---

Okay, I KNOW I might be jumping the gun here, but I just have to say that the new [Firefox Ubiquity Plugin](https://wiki.mozilla.org/Labs/Ubiquity) is the greatest piece of software written.  EVER.

Well, maybe that is jumping the gun a bit, but I am extremely excited to see where this project goes.  I have been very interested in language driven UI's and this is the first time I've seen such an aggressive push for enabling non-developers to write extensions.  This could be huge.  Just think of all the wanna be hackers out there with just a little bit of javascript experience being able to create and deploy mashups that had previously been behind developer's lock and key.

They have done an excellent job of giving you all the tools you need to succeed.  The editor is built in.  No SDK, no extra installation, and best of all, dynamic reloading of your commands (no restarts needed!).  Seriously, I'm a total hack at javascript, and I was able to whip up this simple little integration with [delicious](http://www.delicious.com) in about 20 minutes.

```javascript
CmdUtils.CreateCommand({
  name: "delicious",
  homepage: "http://ryan.codecrate.com/",
  author: { name: "Ryan Sonnek", email: "ryan@codecrate.com"},
  contributors: ["Ryan Sonnek"],
  license: "MIT",
  description: "Tags the current site using delicious",
  preview: "bookmark the current url on delicious",
  execute: function() {
    var document = context.focusedWindow.document;
    var selected_text = document.getSelection();

    var params = Utils.paramsToString({
      url: document.location,
      title: document.title,
      notes: selected_text
    });
    Utils.openUrlInBrowser('http://delicious.com/save'+params);
  }
})
```


Now we just need a [github](http://www.github.com) repo to create these commands and fork away!

