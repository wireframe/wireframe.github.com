---
layout: post
title: "Backgrounded Resque Support"
date: 2010-09-27
comments: false
tags:
 - ruby
 - backgrounded
 - resque
---

[](http://www.flickr.com/photos/stark23x/55575164/)


After an extended rest, Backgrounded is back in action with support for Resque.


[Resque](http://github.com/defunkt/resque) is one of the newer background processing frameworks for ruby applications created by the amazing folks at Github. A weekend of hacking with Resque easily persuaded me to add official support for Resque to the Backgrounded 0.4.1 release.


After getting Resque up and running, the Backgrounded configuration is simple (as always).

```
#config/initializers/backgrounded.rb
require 'backgrounded/handler/resque_handler'

Backgrounded.handler = Backgrounded::Handler::ResqueHandler.new
```


The benefits of Backgrounded really shine when new libraries like Resque pop up. One of the primary goals of Backgrounded is to make it trivial to swap out different backend implementations and not change a single line of your application code. Just update your configuration file and restart. It's a thing of beauty...


Sourcecode on Github.

[http://github.com/wireframe/backgrounded](http://github.com/wireframe/backgrounded)


Latest gem on Gemcutter.

[https://rubygems.org/gems/backgrounded](https://rubygems.org/gems/backgrounded)
