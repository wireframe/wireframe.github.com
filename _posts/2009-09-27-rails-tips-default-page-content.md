---

title: "Rails Tips: Default Page Content"
date: 2009-09-27
comments: false
tags:
 - rails
---

Using Rails layouts is a great way to abstract away commonly rendered elements. Over the past year, I have found myself creating multiple layouts which were essentially the same, and just needed to customize a portion of the content. It's an expensive process to maintain multiple layouts, so I decided to find a more DRY approach.


Here's a simple solution for your layouts to provide the default content, and expose an extension point to allow your templates to override with their own content.

```haml
#app/views/layouts/application.html.haml
%html
 %body
 #header
 - header = yield :header
 = header.blank? ? render(:partial => 'header') : header
 = yield
```


Now each of your views can "inherit" the default markup, or they can override the content by declaring a content\_for block like so:

```haml

#app/views/posts/index.html.haml
- content_for :header do
 .my_special_header
 custom content goes here
```

Simple, elegant and much more maintainable!
