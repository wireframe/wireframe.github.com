---
layout: post
title: "Wicket Preview With One Javascript"
date: 2006-03-10
comments: false
categories:
 - javascript
 - java
 - wicket
---

Third times the charm, right? There's still a few improvements I would like to make to the wicket:preview feature, but here's how I got it to work with a single javascript include.



Here's an example of the new page with only one javascript include.


```html
&lt;html&gt;
&lt;head&gt;
  &lt;title&gt;Offline Preview With One Javascript&lt;/title&gt;

&lt;wicket:remove&gt;
  &lt;script type=&quot;text/javascript&quot; src=&quot;wicket-preview.js&quot;&gt;&lt;/script&gt;
&lt;/wicket:remove&gt;

&lt;/head&gt;
&lt;body&gt;
  &lt;div wicket:id=&quot;loginForm&quot; wicket:preview=&quot;Login.html&quot;&gt;Text should be replaced&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
```

The wicket-preview.js file has changed quite a bit. It is now essentially just a "bootstrapping" script, to load all the other javascript files. It is _heavily_influenced by the [scriptaculous](http://script.aculo.us/) bootstrapping code, but I had to change a few things here and there to make it more understandable for me. I'm not a big fan of the excessive method chaining that they were using, and I'm not too familiar with some of the prototype syntax either. All of the other work has been pushed to wicket-preview-behaviour.js



One _very_important thing to remember, is that the bootstrapping javascript cannot reference any of the included functions. I got stuck on this for a couple hours by trying to bootstrap _and_ reference the Behaviour objects in the same place. Oh well, I guess you live and learn...



```javascript
var WicketPreview = {
  require: function(libraryName) {
    // inserting via DOM fails in Safari 2.0, so brute force approach
    document.write('&lt;script type="text/javascript" src="' + libraryName + '"&gt;&lt;/script&gt;');
  },
  findJavascriptPath: function() {
    var scripts = document.getElementsByTagName("script");
    for (var x = 0; x &lt; scripts.length; x++) {
      var s = scripts[x];
      if (s.src && s.src.match(/wicket-preview\.js(\?.*)?$/)) {
        return s.src.replace(/wicket-preview\.js(\?.*)?$/,'');
      }
    }
  },
  load: function() {
    var path = WicketPreview.findJavascriptPath();
    var includes = 'behaviour,dojo,wicket-preview-behaviour'.split(',');
    for (var x = 0; x &lt; includes.length; x++) {
      var include = includes[x];
      WicketPreview.require(path + include + '.js');
    }
  }
}

WicketPreview.load();
```



The wicket-preview-behaviour.js file is the same as [my previous blog]({% post_url 2006-03-03-auto-previewable-wicket-pages %}). I just had to move the code into a new file to avoid conflicting with the bootstrapping code.


```javascript
var myrules = {
  'div': function(element) {
    var url = element.getAttribute('wicket:preview');
    if (url) {
      dojo.require("dojo.io.*");
      dojo.io.bind({
        url: url,
        load: function(type, data, evt) {
        element.innerHTML = data;
      },
      mimetype: "text/plain"
      });
    }
  }
};

Behaviour.register(myrules);
```



I'm becoming more convinced that this is a killer feature. I have opened a [request for this feature to be integrated directly into Wicket](https://sourceforge.net/tracker/index.php?func=detail&aid=1445715&group_id=119783&atid=684978), but there's been no movement on it yet. If anyone out there thinks this would be useful, please show your support on the Wicket mailing list or directly in the sourceforge issue I opened.



I think this pretty much sums out the outstanding work in order for this feature to be moved into the Wicket core.



  1. Documentation. Maybe add to the wicket examples or some other visible demo?


  2. Add wicket:previewto the official Wicket DTD. The wicket:idattribute is already there, and adding wicket:previewto the DTD will allow designers to create valid XHTML.


  3. Optionally remove the wicket:previewattributes at runtime. Wicket has a setting to automatically remove the wicket:idattribute at runtime, and it should be able to support this as well. It might already handle wicket:*, I don't really know about this one.





My next feat will be to improve this feature to try and handle multiple levels of component inheritance. That should be quite a trick!
