---

title: "Two Forms For The Price Of One"
date: 2006-04-08
comments: false
tags:
 - javascript
 - css
---

For the most part, I'm a Javascript hack, but I keep getting pulled into doing more of it. Here's a little trick I learned recently.



It's pretty common for websites to offer a _simple view_and an _advanced view_for data entry. Heck, even Google has an [advanced search page](http://www.google.com/advanced_search?hl=en).



The addition of an advanced view usually would entail more server side programming to handle the different data entry, but what if that wasn't necessary? What if you only needed to build the server side handling of the _advanced view_and used CSS and Javascript to display the _simple view_?



Just by wrapping your advanced components in a div tag, CSS can be used to hide them. A little Javascript is all you need to change the CSS style so that the advanced view shows up. Here's an example:



```html
&lt;html&gt;
 &lt;head&gt;
  &lt;style type="text/css"&gt;
    .basicView .advanced {
      display: none;
    }
  &lt;/style&gt;

  &lt;script type="text/javascript"&gt;
    function displayAdvancedView() {
      //change from basicView to advancedView
      //this causes the CSS to no longer hide the advanced components
      document.getElementById("form").className="advancedView";
    }
  &lt;/script&gt;
 &lt;/head&gt;
 &lt;body&gt;
  &lt;div id="form" class="basicView"&gt;
   Keywords: &lt;input type="text" name="keywords" /&gt;
   &lt;a href="#" onclick="displayAdvancedView();"&gt;Advanced View&lt;/a&gt;

   &lt;div class="advanced"&gt;
    Start Date: &lt;input type="text" name="startDate" /&gt;
   &lt;/div&gt;
  &lt;/div&gt;
 &lt;/body&gt;
&lt;/html&gt;
```



This example would also require the server side to handle default values for the advanced view since those fields will be posted, even if they are hidden.



This little trick can save quite a bit of development time when applications require a simple and advanced view for data entry. It's not perfect, but it's quick and easy to implement. I think it would be really cool to use [scriptaculous effects](http://script.aculo.us/) to smoothly display the advanced components instead of just magically showing up.

