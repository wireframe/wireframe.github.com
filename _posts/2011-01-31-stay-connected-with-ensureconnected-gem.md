---
layout: post
title: "Stay Connected with the ensure_connected gem"
date: 2011-01-31
comments: false
categories:
 - backgrounded
 - resque
---



This is your application when "MYSQL has gone away"


Most developers working with long running background processes will eventually run into the infamous "MySQL server has gone away" error. This error is thrown when the background processes are idle for an extended period of time and lose their active connection to the database.


There are a few [workarounds](http://gist.github.com/238999) floating around the interwebs to deal with this exception, but the [ensure\_connected gem](https://github.com/wireframe/ensure_connected) is a clean and programmatic solution to take care of this issue once and for all.


The [ensure\_connected gem](https://github.com/wireframe/ensure_connected) wraps any method with a check to ensure that you are connected to the database before performing work.


```ruby
class Worker
  def do_something
    #do your work here.
    #you're connected to the database baby!
  end

  ensure_connected :do_something
end
```


And Resque users have it even better with the [resque-ensure-connected plugin](https://github.com/wireframe/resque-ensure-connected). Simply drop this gem into your project and all of your background job invocations will be wrapped with the ensure\_connected check. This works with the Backgrounded Resque integration as well!


As always, sourcecode is 100% opensource and available on Github.

[https://github.com/wireframe/ensure\_connected](https://github.com/wireframe/ensure_connected)

[https://github.com/wireframe/resque-ensure-connected](https://github.com/wireframe/resque-ensure-connected)


Gems are available for download through Gemcutter.