---
layout: post
title: "Text Truncation With CSS/SASS/Javascript"
date: 2009-10-01
comments: false
tags:
 - javascript
 - rails
 - jquery
 - css
---



Trimming Text In Style
----------------------


It's a very common request to have text elements truncated to prevent breaking your layout.  In the past I've relied on character counting solutions, but that's about as effective as using Java to build a modern day webapp.  Variable width fonts effectively break all character counting solutions.  Each browser/OS has a different font rendering engine which makes truncating based on character counts a fragile and fundamentally flawed solution.


Overflow hidden is the de-facto standard solution to prevent long text from breaking your layout, but it leaves a lot to be desired on the UI side.  It's just not cool to chop off text in mid character.


The text-overflow ellipsis CSS property is the perfect solution to this problem.  It truncates your text at the correct length and inserts the standard "..." ellipsis at the end.  Here's a simple Sass mixin that will add all of the appropriate properties necessary to trigger the text-overflow behavior.


```sass
=truncate(!width)
  :text-overflow ellipsis
  :overflow hidden
  :white-space nowrap
  :display block
  :width= !width
```


Now, you can reuse this chunk of logic in your Sass styles to truncate elements without changing any of your markup!


```sass
//truncate this element at 160 pixels
.my_container
  +truncate(160)

//truncate at 200 pixels
.header
  +truncate(200)
```


This solution degrades gracefully and defaults to using overflow hidden if the client does not support the text-overflow property.  Surprisingly, Firefox is the only modern browser that still doesn't support this CSS property.  Even more surprising is that IE was the first browser to implement this feature!


Javascript can used to emulate the same CSS truncation for browsers that do not support the text-overflow feature.  Here's a great jQuery plugin that does the dirty work so that all clients can see the same sexy truncation.

[http://devongovett.wordpress.com/2009/04/06/text-overflow-ellipsis-for-firefox-via-jquery/](http://devongovett.wordpress.com/2009/04/06/text-overflow-ellipsis-for-firefox-via-jquery/)
