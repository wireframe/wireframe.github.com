---
layout: post
title: "Twitter Style Alerts In Rails"
date: 2009-10-03
comments: false
categories:
 - javascript
 - rails
 - jquery
 - css
---

[Twitter](http://twitter.com/) has a very elegant solution for user feedback messages.  They display the message by sliding the text down from the top of the screen in a semi-transparent block and hide the message after a few moments.  It's a very slick design and one of the more appealing solutions I've seen (and I've worked with a lot of feedback designs).


[](http://img.skitch.com/20091003-x7i4ydi1wuk2jjxpe6kepxxre1.jpg)

[

](http://img.skitch.com/20091003-x7i4ydi1wuk2jjxpe6kepxxre1.jpg)


Why this solution rocks
-----------------------

  - Feedback at the top of the screen prevents hiding important elements in the page body.  This avoids a very common problem with alert/lightbox feedback solutions.
  - The blind down effect draws your attention, yet is not visually jarring.  Apple does an excellent job with similar effects within their products.
  - Absolute positioning the overlay abovethe page content prevents page height popping when sliding down the alert message.
  - Automatically hiding the alert after a time period removes the need for a dismiss button.


Apparently, Twitter rules the world and everything Twitter does needs to be copied by every other application. I've seen [this solution ported to PHP](http://briancray.com/2009/05/06/twitter-style-alert-jquery-cs-php/), so I figured I might as well save people time and show how to accomplish Twitter style alert messages in Rails.  All it takes is a little SASS and jQuery and you'll be set...


See the solution in action at:

[http://twitteralerts.heroku.com/](http://twitteralerts.heroku.com/)



Code for the demo is available on github at:

[http://github.com/wireframe/twitteralerts](http://github.com/wireframe/twitteralerts)



Wire up your layout to have a pretty standard container div for your alert content...

```haml
#app/views/layouts/application.html.haml
%html
  %body
   - if flash[:notice] || flash[:warning]
    %div{:class => "alert  #{'warning' if flash[:warning]}", :style => 'display: none'}
     = flash[:notice] || flash[:warning]
   = yield
```


JQuery does all the work to show/hide the alert message.

```javascript
//public/javascripts/jquery.alertfeedback.js
$(function () {
  var alert = $('.alert');
  if (alert.length > 0) {
    alert.show().animate({height: alert.outerHeight()}, 200);
    window.setTimeout(function() {
      alert.slideUp();
    }, 3000);
  }
});
```


Some fancy CSS to make the alert messages look good.

```sass
//public/stylesheets/sass/application.sass
.alert
  :overflow hidden
  :z-index 999
  :width 100%
  :text-align center
  :position absolute
  :top 0
  :left 0
  :background-color rgb(161,195,0)
  :background-color rgba(161,195,0,.8)
  :height 0
  :color #fff
  :padding 9px 0
  :text-shadow rgba(99,130,0,.75) 1px 1px 1px
  :font-size 21px
  &.warning
    :background-color #800
```
