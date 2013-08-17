---
layout: post
title: "jQuery Snazzy Select Plugin"
date: 2009-08-06
comments: false
categories:
 - javascript
 - jquery
---

HTML Select inputs are notorious for being difficult to style.  Every operating system/browser styles them differently, and there are no standard CSS hooks available to customize their look.  The new jQuery Snazzy Select plugin available on github solves this problem and will turn your ugly ass select fields into sexy works of art!


[http://github.com/socialcast/jquery.snazzyselect](http://github.com/socialcast/jquery.snazzyselect)





Since you can't style the select input directly, you'll need to make a few markup changes to work with the Snazzy Select plugin.  You only need to wrap your existing select input with a div and add another div as a sibling to the select input.  Add the class of "snazzy\_selected" to the sibling div and you're ready to go!


```html
&lt;!-- add a wrapper div around the select input --&gt;
&lt;div&gt;
  &lt;select&gt;
    &lt;option&gt;value 1&lt;/option&gt;
    &lt;option&gt;value 2&lt;/option&gt;
  &lt;/select&gt;
  &lt;!-- add a placeholder div where the selected value will be displayed --&gt;
  &lt;div class="snazzy_selected"&gt;placeholder&lt;/div&gt;
&lt;/div&gt;
```

Initialize the component by calling the snazzySelect() jQuery method, and you'll have some spankin' hot dropdowns! 

```javascript
$('select').snazzySelect();

```


Default CSS styling is included, but it the look is completely customizable.


No changes are necessary for your existing serverside processing.  The html select element will continue to post the existing form field. The Snazzy Select plugin is simply a visual wrapper around the select input.  This also means that your existing jQuery onchange bindings will still work with no modifications.


This marks the first of hopefully many opensource components released from our [Socialcast](http://www.socialcast.com/) toolbox.  The Snazzy Select plugin has been battle tested in our production application and tested in all major browsers (including IE6).  A comprehensive test suite (using Blue Ridge and ScrewUnit) is also included.


Enjoy your snazzy new world!