---

title: "AIR Lightweight Windows Steal Focus By Default"
date: 2009-12-23
comments: false
tags:
 - airfail
 - air
---

Lightweight windows are intended for AIR applications to show simple popup windows and notifications (like my [emulated growl notification system](http://github.com/wireframe/growl-air)).  This is pretty standard stuff and there are a number of [documented tutorials](http://articles.sitepoint.com/article/html-based-adobe-air) and examples that go over this.


```javascript
var options = new air.NativeWindowInitOptions();
options.type = air.NativeWindowType.LIGHTWEIGHT;
options.systemChrome = air.NativeWindowSystemChrome.NONE;
var visible = true;
var scrollbars = false;

var bounds = new air.Rectangle(200, 250, 300, 400);
var htmlLoader = air.HTMLLoader.createRootWindow(visible, options, scrollbars, bounds);

htmlLoader.window.nativeWindow.alwaysInFront = true;
htmlLoader.load(new air.URLRequest("myfile.html"));
```


Executing this simple example will show one very odd and obvious interaction issue. Your supposedly "lightweight" window will steal the focus from your main application window.  Huh, that doesn't seem very lightweight to me.  


The issue is that any window that is created with "visible" set to "true" will automatically be activated once content is loaded.   What a nice little gotcha.  Thanks for the info Adobe!


In order to work around this issue and get your lightweight window to behave as expected, you need to initialize it to hidden and then flip it to visible after the content is loaded using a completely unnecessary extra event listener.


```javascript
htmlLoader.addEventListener(air.Event.COMPLETE, function() {
  htmlLoader.window.nativeWindow.visible = true;
});
```


#airfail
