---
layout: post
title: "Auto Previewable Wicket Pages"
date: 2006-03-03
comments: false
categories:
 - javascript
 - java
 - wicket
---

Previewable Wicket pages, take two...



My [previous blog](http://jroller.com/page/wireframe/?anchor=previewable_wicket_pages) started the ball rolling with previewable Wicket pages, and it's definately worth spending some more time in this area. I would really like to remove the excessive amount of javascript, and make it easier to use out of the box. After brainstorming and debating with a friend for the cleanest solution, we decided to follow Wicket's lead and use a custom namespaced html attribute called wicket:preview.



Wicket already uses namespaced attributes for declaring Wicket specific functionality, so this solution feels like a natural fit. Just point the wicket:preview attribute to any url (relative or absolute) and that url's contents will automatically be inserted into your preview page. The wicket:remove tags are used just to make sure this offline preview magic does not interfere with Wicket during runtime.



Here's a quick demo of how it looks now!



```html
&lt;html&gt;
&lt;head&gt;
  &lt;title&gt;Slick Offline Wicket Page Preview &lt;/title&gt;

&lt;wicket:remove&gt;
  &lt;script type=&quot;text/javascript&quot; src=&quot;behaviour.js&quot;&gt;&lt;/script&gt;
  &lt;script type=&quot;text/javascript&quot; src=&quot;dojo.js&quot;&gt;&lt;/script&gt;
  &lt;script type=&quot;text/javascript&quot; src=&quot;wicket-preview.js&quot;&gt;&lt;/script&gt;
&lt;/wicket:remove&gt;

&lt;/head&gt;
&lt;body&gt;
  &lt;div wicket:id=&quot;loginForm&quot; wicket:preview=&quot;Login.html&quot;&gt;Text should be replaced&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
```



The wicket-preview.js is pretty simple. It uses [dojo](http://dojotoolkit.org/) in the same way as my previous demo, and uses the [Behaviour javascript library](bennolan.com/behaviour/) to automatically parse out the wicket:preview attribute and swap in the included file contents. The implementation is maybe a bit basic, but that can be improved later. It seems like the majority of included components use a div tag, but it probably should support the span tag as well.


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



One outstanding issue is that this solution doesn't support multiple levels of components (ex: pages including components which include other components). That's not really a big deal, but I'm open to suggestions if there's something that can be done to support it.



It would also be a nice improvement to only require user's to import one javascript file. I think there's some way to have javascript include other javascript, but I don't know much about it. I think scriptaculous does something like this, so maybe I'll dig into that later...



Now, I'd like to present this feature to the core Wicket developers to get feedback. I'd love to contribute this and work with them to integrate this functionality directly into Wicket. This could be yet another notch on Wicket's belt, and improve it's status as one of the best web frameworks out there. We'll see where this goes from here!
