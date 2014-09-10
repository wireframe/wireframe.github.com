---

title: "Toaster Notifications for AIR Apps using jQuery"
date: 2009-12-24
comments: false
tags:
 - jquery
 - air
---

User notifications has been a standard feature of our modern software applications for quite some time now. Growl has been around on Mac for years. Linux has libnotify and Windows has Snarl.


What options to AIR developers have to leverage the user's native messaging system? None. Zero. Zip.


Adobe was supposedly working on this [back in 200](http://www.mikechambers.com/blog/2008/11/13/growl-support-for-adobe-air-applications/)8, but we have yet to see one single deliverable bit of code. Seriously? It takes two years to integrate with one of the most standard core features provided by modern day operating systems? Titanium had this built into their Desktop SDK since practically day one.


Instead of integrating with the native notification system, AIR applications are left to "emulate" these notifications as a horrible, horrible hack. Eventually, someone over at Adobe thought it would be smart to put together [a tutorial](http://www.adobe.com/devnet/air/flash/quickstart/creating_toast-style_windows.html) to appease developers that demanding for this feature. Unfortunately, AIR continues to be dominated by [Flex folks ](http://www.webreference.com/programming/adobe_air/working_with_windows/)and all of us HTML developers get left in the cold.


I was able to scrounge up a few existing Javascript libraries that work with AIR to emulate system notifications, but each is tied to a different Javascript framework

* DOJO - [http://o.sitepen.com/labs/dair/](http://o.sitepen.com/labs/dair/)

* MooTools - [http://cookbooks.adobe.com/post\_Creating\_a\_transparent\_notification\_window-8226.html](http://cookbooks.adobe.com/post_Creating_a_transparent_notification_window-8226.html)

* Prototype - [http://github.com/wireframe/growl-air](http://github.com/wireframe/growl-air)


Hey, where's the jQuery love? Well, I guess it's my call in life to fill the void! I'm happy to announce the jquery.air.notification plugin that brings Growl like notifications to your Javascript AIR app! The API is incredibly simple:

```javascript
$.air.notify('hello world');

```





code is available on github. Just drop the Javascript and template files into your app and you're good to go!


Features
--------

  - 100% skinnable. This is the beauty of bringing web technologies to the desktop. CSS absolutely rocks for this kind of thing.
  - tiling of notification windows if multiple are received. This prevents the user from missing any notifications.
  - auto fade out after specified interval or click on popup to dismiss


Hit me up if you have any feature requests. I'm considering adding support for HTML notifications, but I'd like to hear some feedback from users first.


I still find it appalling that this is not something built directly into the AIR SDK and I am hoping that this library will become unnecessary sooner rather than later. In the meantime, this should greatly help AIR developers get started quickly and not need to reinvent the wheel.
