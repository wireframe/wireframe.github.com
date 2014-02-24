---
layout: post
title: "Mailinator Google Chrome Extension"
date: 2010-02-07
comments: false
tags:
 - chrome
---




Have you ever visited a website that required an email registration form, but you really didn't want to give out your primary email address? [Mailinator](http://www.mailinator.com/) is a wonderful service that helps rid the world of junk mail, one garbage email address at a time.


Using a one-time use email inbox is a great way to keep unsolicited email out of your way. And now the [Mailinator Google Chrome extension](https://chrome.google.com/extensions/detail/bcnflfkionidoobcineimfoollmbalbp) makes it even easier to generate a one-time email address to get you through those annoying site registration forms.


Features include:


  - one click generation of a random email address
  - popup widget to check your mailinator email inbox





Under the covers, the plugin is very simple. Mailinator provides a pretty decent [iframe integration](http://www.mailinator.com/widgetmaker.jsp) out of the box, and generating a [random email inbox in Javascript](http://www.broofa.com/Tools/Math.uuid.js) is pretty trivial.


The code is [100% open source and available on github](http://github.com/wireframe/mailinator-chrome-extension). I'd love to add in a "Copy address to clipboard" feature, but it [looks like Flash is the only way to accomplish that](http://stackoverflow.com/questions/127040/put-text-on-the-clipboard-with-firefox-safari-and-chrome). Let me know if you have any other suggestions.


I have no affiliation with Mailinator. I'm just a hacker that is very sick of sites requiring email addresses and not offering open ID integration. :)
