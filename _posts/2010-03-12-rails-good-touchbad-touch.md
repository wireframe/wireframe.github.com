---
layout: post
title: "Rails \"Good Touch\"/\"Bad Touch\""
date: 2010-03-12
comments: false
tags:
 - ruby
 - rails
---



Rails is bit like a dirty old man.


Consider this example

```ruby
class User   
  after_save :do_something_expensive
end
```


Rails makes it trivial to update timestamps, and I found out the hard way that the underlying implementation leaves a lot to be desired.

```ruby
User.first.touch
```


Easy, right? But, did you know that this useful little method will fire all of your after\_save callbacks?  This led to some nasty performance problems recently, and now you can now stop Rails from having it's way with you!  Bad Touch Rails!


The good\_touch project is now available on [github](http://github.com/wireframe/good_touch) and [gemcutter](http://rubygems.org/gems/good_touch) and eliminates the overhead for updating a simple timestamp attribute.  It's as easy as using the standard/bad touch method without all the horseplay.

```ruby
User.first.good_touch
```


Let the touching continue...
