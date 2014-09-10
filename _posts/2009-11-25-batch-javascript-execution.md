---

title: "Batch Javascript Execution"
date: 2009-11-25
comments: false
tags:
 - performance
 - javascript
---

Let's say you're in a bit of a mess with the performance of your fancy web application's Javascript. Your application needs to do a lot of work on the front end. I'm talking a lot of repetitive work that takes a long time. Since Javascript is single threaded the end user's experience is pretty horrible. Their web browser essentially "locks up" while you do all of your work and Firefox users will even be prompted with "Unresponsive script" alerts. How are you going to optimize this?


The "correct" answer is to either reduce the number of times you need to do the work, or to make each execution as fast as humanly possible. Although that is a great suggestion, it's also potentially expensive and time consuming. There comes a point of diminishing returns when you've fixed all the low-hanging fruit and you're only shaving off milliseconds with each change. What if we could get a great user experience without going through all that work? Well, now you can!


The trick is to allow the browser to breathe between executions. Executing your work in batches gives the browser time to re-draw and keeps the UI from locking up. Although we're actually increasing the total execution time for doing your work due to the extra delays, the browser remains much more responsive and it greatly improves the end user experience.


As an example, consider an application that is constructing a *huge* table via javascript. (Let's ignore the fact that the unit of work is not optimized like it should be)

```javascript
$.each(myHugeArray, appendTable);

function appendTable() {
 $('<tr><td>test</td></tr>').appendTo($('#myTable'));
}
```

This is your Javascript...


Given enough iterations, this implementation will cause the browser to grind to a halt until the work is complete. Instead of doing all the work at once, we can break it up into batches to help the end user experience. Now, let's look at this solution that does the exact same work, just broken up into batches.

```javascript
doInBatchesWithDelay(myHugeArray, appendTable, 5, 10);

function appendTable() {
 $('<tr><td>test</td></tr>').appendTo($('#myTable'));
}

function doInBatchesWithDelay(array, callback, batchSize, delay) {
 for (var x = 0; x; x++) {
   if (array.length >0) {
     callback(array.pop());
   }
  }

 if (array.length > 0) {
   setTimeout(function() {
     doInBatchesWithDelay(array, callback, batchSize, delay);
   }, delay);
 }
}
```


[](http://www.hulu.com/watch/17201/saturday-night-live-sloths)

This is your Javascript in BATCHES! It's still slow, but it'll kick your face in a punch fight!


This might be considered a hack, but not so! The end user experience is all that matters, and they have no concern for what tricks we have to use to keep the UI snappy. The cost to profile and optimize applications is usually quite high and this is something you can easily drop in today and quiet the complaints of application sluggishness. Addressing their problem with this small change will give you some headroom to work on rearchitecting your slow-ass implementation if needed.


Now, go forth and batch!
