---
layout: post
title: "jQuery DOM Manipulation Performance"
date: 2009-11-02
comments: false
tags:
 - performance
 - jquery
---

Everyone says that "avoiding DOM manipulation" is a key to improve javascript performance, but their understanding of the root issue is slightly skewed. In reality, manipulating elements is extremely fast until the element has been added to the DOM. No need to throw away the wonderful append/prepend jQuery API's and drop down to the low level innerHtml tricks to get great performance. Just make sure that you're manipulating element fragments before they're added to the DOM.


The difference between these two blocks of code is subtle, but incredibly important.

```javascript
//adds element to DOM and *then* does the manipulation
$('<div>some text</div>').appendTo(someElement).doSomeManipulation();


//manipulates the element fragment *before* adding to the DOM
$('<div>some text</div>').doSomeManipulation().appendTo(someElement);
```


It's extremely important to be aware of when elements have been added to the DOM and beware manipulating elements once they are in place.


You can make incredible improvements to your javascript performance by performing the majority of your work before adding your elements to the DOM. By simply reordering your chain invocation, I've seen as much as a 10x improvement in javascript performance with this one technique (500 millis down to 50 millis after this change).


This is not necessarily a global fix for all javascript performance issues. There may be times when you actually need the element inserted into the DOM before doing more work (ex: embedding flash content), but it's worth a shot to see if this approach works with your application!
