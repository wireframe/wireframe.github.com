---
layout: post
title: "Javascript AOP"
date: 2005-10-14
comments: false
categories:
 - javascript
---

Yesterday, I had a truly mind bending experience...

   
   
With all of my [recent](http://jroller.com/page/wireframe/?anchor=indicator_while_processing)[work](http://jroller.com/page/wireframe/?anchor=new_draggabletarget)[using](http://jroller.com/page/wireframe/?anchor=wicket_drag_drop_components)[scriptaculous](http://jroller.com/page/wireframe/?anchor=choice_is_good), I never thought there would be a clean way to attach dynamic (AJAX, javascript) functionality to HTML components. I just accepted that the rendered HTML would be "tagsoup" and went on my merry way. Even general concepts like [graceful degradation](http://webtips.dan.info/graceful.html) and accesibility didn't concern me because, "if you don't want to run a bleeding-edge browser, that's your problem!" :)

   
   
Then, I was introduced to the [behavior](http://bennolan.com/behaviour/) javascript library. It's a javascript library that allows you to dynamically "attach" behavior to HTML elements based on standard CSS selectors. If the user's browser doesn't support javascript, the behavior is simply not attached. And all this functionality is supported without writing script blocks within the HTML body. I HIGHLY encourage web 2.0 developers to check this out.

   
   
I've started updating the wicket scriptaculous package to use behavior. The non-AJAX autocomplete text field is the first component to use behavior, and I'll try to convert the other components this week. So far, so good!

