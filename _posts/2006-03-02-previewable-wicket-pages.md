---

title: "Previewable Wicket Pages"
date: 2006-03-02
comments: false
tags:
 - javascript
 - java
 - wicket
---

One of my favorite features of [Wicket](http://wicketframework.org) is the ability to preview a dynamic page without nasty embedded scriptlets or JSP custom tags. I believe [Tapestry](http://jakarta.apache.org/tapestry/) also has previewable pages since it works quite similar to Wicket.



Even the "holy grail", [Ruby on Rails](http://www.rubyonrails.org/), is no better than JSP for previewable web pages, which I find interesting since [37signals](http://www.37signals.com) is such an advocate of [working directly with the actual UI and not with mock ups](http://www.37signals.com/svn/archives/001050.php). You would think they'd be frothing at the mouth for completely clickable UI's from day one.



Wicket is a "component framework", which means you can extract pieces of your page into reusable pieces. This has huge benefits for building applications quickly, and it truely is the only way to achieve Object Oriented web development. There is a downside to building reusable components though. Once you start extracting common pieces of your page into components, you lose previewability again. The good news is that I think this is a fixable problem.



Here's an example where my test page has extracted out the login widget into a seperate component. Essentially, my page preview just went in the toilet...


```html
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Strict//EN&quot;
   &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd&quot;&gt;

&lt;html&gt;
&lt;head&gt;
  &lt;title&gt;Lame Non-Previewable Page&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
  &lt;div id=&quot;login&quot;&gt;Text should be replaced&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
```



Now, with just a bit of AJAX magic, I can preview my test page and have the browser dynamically pull in my extracted component. I've used [scriptaculous](http://script.aculo.us/) for this kind of Javascript before, but this time I decided to give the [dojo toolkit](http://dojotoolkit.org/) a try.



```html
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Strict//EN&quot;
   &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd&quot;&gt;

&lt;html&gt;
&lt;head&gt;
  &lt;title&gt;Snazzy Dynamic Include&lt;/title&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;dojo.js&quot;&gt;&lt;/script&gt;
&lt;script language=&quot;JavaScript&quot; type=&quot;text/javascript&quot;&gt;
  dojo.require(&quot;dojo.io.*&quot;);
  dojo.io.bind({
    url: &quot;Login.html&quot;,
    load: function(type, data, evt) {
      document.getElementById(&quot;testInclude&quot;).innerHTML = data;
    },
    mimetype: &quot;text/plain&quot;
  });
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
  &lt;div id=&quot;login&quot;&gt;Text should be replaced&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
```



This is a pretty slick little example on how to get previewable pages for Wicket. I'll try to put together another post soon to bring this concept to the next level.
