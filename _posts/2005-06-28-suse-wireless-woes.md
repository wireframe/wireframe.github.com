---
layout: post
title: "SuSE Wireless Woes"
date: 2005-06-28
comments: false
categories:
 - linux
---

I have now spent three days trying to upgrade my wife's computer from SuSE 9.1 to SuSE 9.3. I was hoping that the setup of my wireless USB adapter would go smoother than [last time]({% post_url 2005-06-28-suse-91-usb-wireless-configuration %}) but, I'm sad to say that 9.3 is actually much worse.



My hopes were high when I first plugged in my USB adapter. Yast instantly recognized and installed drivers, and for about 5-10 minutes all was right in the world. I should have known that it was too easy, and wouldn't last. After about 10 minutes, my system locked up and was completely unresponsive. A hard shutdown was the only solution, and after the system rebooted, it would run for about 5 minutes more before locking up again. [Seems like all atmel usb cards lock up in SuSE 9.3](http://www.linuxquestions.org/questions/archive/41/2005/05/2/315331). All sources point to [these problems being with 9.3](http://lists.suse.com/archive/suse-amd64/2005-Apr/0152.html), since the same adapters worked with 9.1 and 9.2.



A bit of googling suggested trying to configure the USB adapter to use the original Windows drivers and emulate them under Linux using [ndiswrapper](http://ndiswrapper.sf.net). Several hours later, I was no closer to a solution.



After jumping through hoops to try and get my Belkin adapter to work, I decided my time would be better spent elsewhere. Since I run Linksys networking equipment for my house, I bought a Linksys WUSB11v4 Adapter in hopes that it would be better supported. My assumption that Linksys would be easier, was sorely mistaken.



For starters, the Linksys was not even recognized by Yast. Several forums recommended installing [the berilios driver](http://at76c503a.berlios.de/), but [the driver only supports version 2.1, 2.6 and 2.8](http://at76c503a.berlios.de/devices.html), which does me a lot of good. I don't exactly find it comforting when the driver everyone is told to install, is almost 2 versions behind released hardware. In fact, [some people have recommended buying the older adapters off eBay](http://forum.netgem.com/viewtopic.php?t=2650&start=10&sid=95d387067551ab63a832045f11482451) to get around this problem. I forged ahead and tried the driver anyways to no avail.



Needless to say, I will be reinstalling, for the seventh time, with SuSE 9.2 tonight. It looks like [one person appears to have gotten around this issue](http://nixdoc.net/files/forum/about41079.html), but with no documentation posted, I'm not messing around with it.

