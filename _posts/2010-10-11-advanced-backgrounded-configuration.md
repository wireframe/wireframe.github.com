---
layout: post
title: "Advanced Backgrounded Configuration"
date: 2010-10-11
comments: false
tags:
 - ruby
 - backgrounded
 - resque
---



### Mr. Sparkle says, "Wow! Backgrounded is super terrific!" (loose translation)


In the wake of the backgrounded ruby gem release, only two complaints have been raised about the library...


First: the backgrounded API is just too damn intuitive. It is literally so beautiful that every other background processing API feels like a giant turd. Using backgrounded abstracts implementation details between various frameworks so developers can focus on writing kick ass apps. Sorry folks, but I have no intention of fixing this issue. :)


Second: The elegance and simplicity of the backgrounded abstraction has proven too limiting for developers that need greater control 'under the hood'. The 0.6.0 release of backgrounded should satisfy these power hungary devs by supporting an optional configuration hash for each backgrounded method. Any options specified in your backgrounded class will be passed through to tweak the specific background processing handler in use.


The first backgrounded handler to honor the optional configuration is the [Resque integration]({% post_url 2010-09-27-backgrounded-resque-support %}) which now supports configuration of the particular queue the backgrounded method will be run in. The default behavior is to run all backgrounded methods in a single default queue (named backgrounded) and this can be overridden by passing in the optional :queue name for any backgrounded method.


It is vitally important that the introduction of these advanced configuration options not break the existing API. The beauty and simplicity of the original backgrounded API is still very much intact and all existing clients will continue with the default behavior with no change. Here's an example to show how the original backgrounded methods can be configured right alongside with advanced backgrounded methods.


```ruby
class Blog
  backgrounded save_to_filesystem, :email_followers => {:queue => :low}

  def email_followers
  end

  def save_to_filesystem
  end
end
```


Sourcecode on Github.

[http://github.com/wireframe/backgrounded](http://github.com/wireframe/backgrounded)


Latest gem on Gemcutter.

[https://rubygems.org/gems/backgrounded](https://rubygems.org/gems/backgrounded)
