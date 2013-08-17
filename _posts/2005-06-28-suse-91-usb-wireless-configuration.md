---
layout: post
title: "SuSE 9.1 USB Wireless Configuration"
date: 2005-06-28
comments: false
categories:
 - linux
---

My love for SuSE was almost lost while trying to setup a Belkin wireless USB adapter (F5D6050 version 2000) for my PC. My problems were rooted in the fact that I have a standard ethernet card and the USB adapter. They did not play well together, and for the record (and hopefully for others who need the info), here were the steps to get it up and going:

   
   
  - Use YAST to install atmel driver.

   
  - Plug USB adapter into PC (if already plugged in, need to unplug then plug back in).

   
  - run ifconfigto see that adapter obtained IP address.

   
  - run ifdown eth0to disable the ethernet card.

   
  - run ifdown wlan0to disable the USB adapter.

   
  - run ifup wlan0to re-enable the USB adapter.

   
   
I'll be trying this again when I reinstall with SuSE 9.3, so we'll se if things go any smoother.

