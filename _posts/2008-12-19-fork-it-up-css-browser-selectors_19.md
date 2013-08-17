---
layout: post
title: "Fork it up - CSS Browser Selectors"
date: 2008-12-19
comments: false
categories:
 - ruby
 - css
---

If you're really passionate about designing great websites, browser specific CSS is a necessary evil.  We all wish it wasn't needed, but thanks to web browsers that suck ass *cough* IE *cough*, we need an effective way to alter our CSS styles based on browsers.
   
   

   
   
   

   

   
 There are lots of different solutions for how to implement browser specific CSS.  Options range from [javascript](http://rafael.adm.br/css_browser_selector/) or [conditional comments](http://www.quirksmode.org/css/condcom.html) to [server side solutions](http://latimes.rubyforge.org/svn/plugins/css_browser_selector/).  The Ruby on Rails [CSS Browser Selector plugin](http://github.com/latimes/css_browser_selector/tree/master) is by far
   
the best solution I've used.  It is a very simple plugin that
   
automatically adds some extra CSS classes to your html so that you're
   
able to apply extra styling based on browser (or operating system). 
   
It's drop dead easy to integrate into your project, and allows you to
   
keep your browser specific hacks in context with the rest of your styling.  
   
   
   
   
   
   
example rendered html source:
   
   

   
   
   
   
 
hello world
===========

   
   
   
   
   
   

   
   

   
 example css for browser specific styles:
   
   

   

   

   
span.date {
   

   

   
  color: blue;
   

   

   
 }
   

   

   
 body.ie6 span.date {
   

   

   
  padding: 2px;
   

   

   
 }
   

   

   
   
   

   
If you want to make these browser specific hacks even more managable, take a look at SASS:
   

   

   
span.date
   

   

   
  :color blue
   

   

   
  body.ie6 &
   

   

   
   :padding 2px
   

   

   
   
   

   

   

   
 I have not seen server side solution like this for the Java world, but maybe one of those wicked Wicket developers can whip something up!  =)
   
   

   

   
   
   

   

   

   
 That's enough backstory on this awesome plugin.  The real point of this post was to announce that I have [forked the CSS Browser Selector plugin](http://github.com/wireframe/css_browser_selector/tree/master)
   
to run on Rails 2.2 with no deprecation warnings.  Super small change,
   
but it should make your life a bit better by removing the annoying
   
deprecation warnings.  Check it out on [github](http://github.com/wireframe/css_browser_selector/tree/master).
   

   

   
   
   

   

   
 Oh, and my personal favorite browser specific CSS trick is this:
   

   

   
body.ie6 {
   

   

   
  display: none;
   

   

   
}
   
