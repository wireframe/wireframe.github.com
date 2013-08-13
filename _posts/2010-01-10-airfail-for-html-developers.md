---
layout: post
title: "#airfail for HTML Developers"
date: 2010-01-10
comments: false
categories:
 - airfail
 - air
---

[Opinions on ADOBE AIR](http://amplicate.com/sucks/adobe-air)
   

   
Incase you haven't heard, [Adobe AIR is a complete and utter failure for developing desktop applications with HTML/CSS/Javascript technologies](http://blog.codecrate.com/2009/08/end-of-adobe-air.html). It's primary purpose is to provide Flash/Flex developers the ability to exploit the desktop.  It's secondary purpose is to simply frustrate and antagonize HTML/CSS developers past the point of frustration.
   
   
Here is a short list of the very real issues I've encountered while building and deploying AIR applications. This is not simply a list of problems dug up from an issue tracker or forum. Every one is an issue I've worked through to the point of pulling my hair out.  This list should serve as a warning to any potential developers considering Adobe AIR. You'll regret it...mark my words. The fact that Adobe advertises AIR as a viable runtime for HTML/CSS developers is one of the greatest crimes against humanity I have witnessed in recent history.
   
   
No HTTP Headers sent with file uploads
   
Dealing with HTTP headers is an extremely standard requirement especially when working with secured services that require Basic Authentication. The AIR SDK has fairly well documented methods to configure sending HTTP headers with outgoing requests, BUT for some reason [the SDK fine print states that "custom HTTP request headers are not supported in uploads or downloads"](http://help.adobe.com/en_US/AIR/1.5/devappshtml/WS5b3ccc516d4fbf351e63e3d118666ade46-7cb2.html). Excuse me? You're kidding right? Multipart HTTP multipart headers are already being sent with file uploads so why the hell prevent other headers from being added? Why support HTTP headers for every remote request except for file uploads? The AIR SDK gives you direct access to a Socket for God's sake. Do I have to write my own fucking multipart upload?
   
   
Every single application that relies on Flash technology, which includes web based SWF projects as well as HTML and Flex AIR apps, suffer from this bug. This blatant hole is yet another reason Flash will be dead as soon as HTML5 is more widely adopted.
   
   
random "corrupt" installation file
   
Try to install an app and [receive a "corrupt file" error](http://www.bryanbartow.com/wp-content/uploads/2008/06/capture-1.png). reinstall the app and it works fine. Awesome. Our QA team has encountered this issue frequently enough that it's become standard issue to just ignore the errors.
   
   
### Integration with Native OS (Or lack there of)

AIR offers so little integration with "native" features, that it's hard to call out any particular failures and I guess that's one of my biggest gripes with AIR. If you're building a runtime for desktop applications, having integration with the native desktop OS is a pretty necessary and compelling feature.
   
   
No Integration with Native Notification Systems
   
Adobe supposedly was working on this [back in 2008](http://www.mikechambers.com/blog/2008/11/13/growl-support-for-adobe-air-applications/). Seriously? It takes two years to integrate with one of the most standard core features provided by modern day operating systems? Growl has been around on Mac for years. Linux has libnotify and Windows has Snarl. Titanium has had this built into their SDK since practically day one.
   
   
Sure, you can [emulate these notifications with AIR](http://github.com/wireframe/growl-air), but it is such a horrible, horrible hack and forces every single app to reinvent the wheel.
   
   
no integration with dock icons
   
most commonly used on Mac, but applicable to other platforms as well. Fluid is a perfect example of exposing a simple api to control dock icons. This is a minor issue and not directly a "bug" but this came up frequently in our business requirements and AIR was unable to perform the expected task.
   
   
sharing cookies with browser
   
This is just plain disgusting. Why in the world would you build a runtime that is [coupled to the underlying OS session/cookie management system](http://www.12robots.com/index.cfm/2009/9/22/AIR-Tip-Cookie-Sharing)? This extremely unexpected behavior which has cost me tons of troubleshooting time where a user could log into a site using their web browser and essentially "hijack" the credentials of the AIR application.
   
   
Window Handcuffs
   
The AIR windowing API is clunky and frustrating pile.  Not only that, but it also is broken.
   
  - [lightweight windows stealing window focus](http://blog.codecrate.com/2009/12/air-lightweight-windows-steal-focus-by.html)
  - hidden application windows on OSX will be activated and focused when receiving popup notification. (blog post coming soon)

   
No global mouse move events
   
With no way to detect mouse pointer location when outside of your application, it is absolutely impossible for you to build headless applications that listen and react to mouse gestures.
   
   
### Crippled Webkit

Webkit is an extremely fast moving project. There are new features being added every day, and when Adobe chose to include Webkit into their runtime, I'd expect them to [include info on the version of Webkit that is included](http://stackoverflow.com/questions/1569541/what-version-of-webkit-does-adobe-air-use). Is CSS3 available? is HTML5 available? Well, it's up to the developer to find out with good old trial and error. Here are some of the more "common" things I was unable to do with the specific version of webkit included in AIR 1.5.
   
   
  - doesn't support webkit custom scrollbars
  - Sporadic support for HTML5 attributes. placeholder attribute available for text input, but not textarea
  - doesn't support title attribute for very standard browser tooltips.

   
I consider these Adobe's issues because the version of Webkit included in the AIR runtime is ridiculously out of date. I've been implementing these features in actual web apps for nearly a year now (and there's no reason the title attribute doesn't work). AIR2 will ["supposedly" be updating it's version of Webkit](http://labs.adobe.com/wiki/index.php/AIR_2:Release_Notes#New%5FFeatures%5Fin%5FAIR%5F2), but I highly doubt that Adobe will be smart enough to provide reference documentation for developers to know what features are available.
   
   
### Cross Platform Issues

No multiplatform runtime is perfect, but web browsers are by far the best technology available to provide a consistent cross platform experience. Webkit was an excellent starting point for AIR, but the underlying runtime has plenty of cross platform issues. Here are some of the major issues I've run into
   
   
Windows
   
   
  - [Antialiasing causes purple text](http://forums.adobe.com/thread/469531?tstart=0)
  - [System alerts for Unknown/untrusted certificates](http://forums.adobe.com/thread/525228)
  - [autoupdate causes process process to hang on windows](http://forums.adobe.com/thread/462791)

Linux
   
   
  - [Images hosted on SSL CDN cause system alerts](http://forums.adobe.com/thread/525225)

   
Mac
   
   
  - [Keychain prompts for PrivateEncryptedData](http://forums.adobe.com/thread/529807)

   
   
### Performance

I'm very aware that there is a cost to run an application in a runtime environment. I've built Java applications for years and had to deal with the memory bloat for apps running in a Java runtime, but I don't think I'm asking a lot here.
   
   
The majority of AIR applications are mashup/widgets that are intended to be always on background services, but nearly every AIR application sits idle at ~10% CPU on a dual core Macbook Pro.  It's simply ridiculous and again all fingers point to the underlying flash runtime. One common trick is to [manually override the flash framerate](http://www.gskinner.com/blog/archives/2009/05/idle_cpu_usage.html) to improve performance. It's pretty ridiculous that the runtime isn't smart enough to handle this when your application is minimized or otherwise hidden.