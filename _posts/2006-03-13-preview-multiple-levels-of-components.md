---
layout: post
title: "Preview Multiple Levels of Components"
date: 2006-03-13
comments: false
categories:
 - javascript
 - java
 - wicket
---

My [previous]({% post_url 2006-03-10-wicket-preview-with-one-javascript %}) [incarnations]({% post_url 2006-03-03-auto-previewable-wicket-pages %}) of the wicket:preview feature have fallen short when trying to preview multiple levels of components. I personally don't think it's that big of a deal for the preview to not handle this, but based on the feedback I've received, I decided to at least look into it.



Here's a sample scenario that I've been using to test this idea out.


```
 mysite
 |__Home.html -- This is the homepage that includes the login panel
 |__login
 | \__Login.html -- The login panel includes the cool widget
 |__widget
 | \__CoolWidget.html
```



### mysite/Home.html


```html
&lt;html&gt;
&lt;head&gt;
  &lt;title&gt;Preview Multiple Levels of Components&lt;/title&gt;

&lt;wicket:remove&gt;
  &lt;script type=&quot;text/javascript&quot; src=&quot;wicket-preview.js&quot;&gt;&lt;/script&gt;
&lt;/wicket:remove&gt;

&lt;/head&gt;
&lt;body&gt;
Welcome to my cool site!
  &lt;div wicket:id=&quot;loginForm&quot; wicket:preview=&quot;login/Login.html&quot;&gt;Text should be replaced&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
```



### mysite/login/Login.html


```html
username: &lt;input wicket:id=&quot;username&quot; type=&quot;text&quot; name=&quot;username&quot; /&gt;
password: &lt;input wicket:id=&quot;password&quot; type=&quot;password&quot; name=&quot;password&quot; /&gt;

&lt!-- Notice the path used to the next component is relative to this component.  NOT the home page!  --&gt;
&lt;div wicket:id=&quot;widget&quot; wicket:preview=&quot;../widget/CoolWidget.html&quot;&gt;
widget goes here...
&lt;/div&gt;
```



### mysite/widget/CoolWidget.html


```html
WOW!
```



Using this setup, how exactly can multiple levels of components be previewed? The path from the Home template to the Login template is straight forward, but the path from the Login template to the CoolWidget is relative to the Login template, not the Home page!



I've reworked the wicket-preview-behaviour.js to support this setup by recursively including the components. Each time an element is included as a preview, It's path to the included component is saved and tacked onto any included components that need to be previewed. I'm no javascript expert, but the code didn't turn out too bad!



### wicket-preview-behaviour.js


```javascript
dojo.require("dojo.io.*"");

function insertPreview(element, url) {
  dojo.io.bind({
    url: url,
    load: function(type, data, evt) {
      if (url.indexOf('/') != -1) {
        var path = url.substring(0, url.lastIndexOf('/') + 1);
        //add path to current component to next preview object
        data = data.replace('wicket:preview=\"/g, "wicket:preview=\"" + path);
      }
      element.innerHTML = data;

      //remove attribute to prevent infinite recursion
      element.removeAttribute('wicket:preview');

      //apply rules to newly included components
      Behaviour.apply();
    },
    mimetype: "text/plain"
  });
}

var myrules = {
  'div': function(element) {
    var url = element.getAttribute('wicket:preview');
    if (url) {
      insertPreview(element, url);
    }
  }
};

Behaviour.register(myrules);

```



My favorite part of this feature is that developers don't need to change any of their HTML templates in order for this to work. All you need to do is drop in the updated javascript file, and it "just works". I think that would be valuable for the div preview to have some special CSS style, but that can be handled later. Maybe someone with better UI abilities can give feedback on what would be appropriate.



Are there any other outstanding issues that Wicket developers/users can think of?

