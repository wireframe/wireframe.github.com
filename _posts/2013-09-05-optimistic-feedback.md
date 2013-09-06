---
layout: post
title: "Optimistic Feedback for Improved User Experiences"
categories:
 - javascript
---

Click on nearly any link in a Web 2.0 application and you're almost guaranteed to experience the following:

* an inline spinner to show progress while some work takes place
* a delay of an indeterminate amount of time while you wait for **something** to finish
* spinner goes away and you get some kind of feedback that the work is complete.

Here is a pretty classic example of how most web applications accomplish this.

```javascript
$(document).on('click', 'a.delayed_feedback', function(e) {
  e.preventDefault();
  var $link = $(this);
  $.ajax({
    url: '/path/to/endpoint',
    beforeSend: function() {
      // show an indicator while work is being processed
      $link.addClass('processing');
    },
    success: function() {
      // wait until XHR completes to give user feedback of success
      $link.addClass('success');
    }
  });
});
```

This delayed feedback interaction is appropriate for some use cases, but is it *always* necessary?  Showing a "spinner" immediately forces a user to wonder **how long will this take and when will it complete**?

In start contrast, take a look at how Facebook implements their interaction for the Like button.  Clicking "Like" gives you **immediate** feedback and flips the state to success even before a request has been fired.  That's right...they're cheating a bit and assuming that the request **will** succeed eventually.  And guess what?  Over 99% of the time, the operation completes without any issues.  This is an amazing UX for users and completely removes the disconnect between a user requesting work to be done and wondering if/when it will complete.

Building this style of interaction is actually extremely trivial to implement:

```javascript
$(document).on('click', 'a.immediate_feedback', function(e) {
  e.preventDefault();
  var $link = $(this);
  $.ajax({
    url: '/path/to/endpoint',
    beforeSend: function() {
      // assume success and give immediate
      // feedback to the user
      $link.addClass('success');
    }
  });
});
```

Wow, talk about an improvement.  Feedback is instant, and the **perceived** performance of the application jumps ten fold.  Faster feedback equals happy users.

![](http://farm6.staticflickr.com/5017/5428693024_f2c76f1d00.jpg)


### One More Thing...

I can hear you screaming through the fibers of the internet...**WHAT IF SOMETHING FAILS**!

First of all, it's absolutely critical for you to be able to *quantify* how likely the failure scenario is.  **Measure it**.  You can start with your existing "delayed feedback" solution and review how likely a failure scenerio is to occur.  Next, you'll need to determine how critical is it from a user's perspective if something *seemed* like it worked and then it didn't.  In the example of the Facebook Like button, a missed "Like" far from a mission critical failure.

If you **need** to worry about failure conditions, a few options include:

* revert the state back to the original pre-XHR state
* tell the user that something went wrong and ask them to re-load the page

Here's a simple example that gives a nice blend of immediate feedback plus error handling for the edge case when something goes wrong.

```javascript
$(document).on('click', 'a.immediate_feedback', function(e) {
  e.preventDefault();
  var $link = $(this);
  $.ajax({
    url: '/path/to/endpoint',
    beforeSend: function() {
      // assume success and give immediate
      // feedback to the user
      $link.addClass('success');
    },
    error: function() {
      // oops! something went wrong
      // revert back to previous state
      $link.removeClass('success');
    }
  });
});
```

It's all about finding the right tool (or interaction) for the right job.  Keep this trick in your tool belt and use it whenever appropriate to make your next user experience awesome!