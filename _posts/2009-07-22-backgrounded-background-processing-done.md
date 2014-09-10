---

title: "Backgrounded - Background Processing Done Right"
date: 2009-07-22
comments: false
tags:
 - ruby
 - backgrounded
 - opensource
---




I'm going to come right out and say it...

Every ruby background job solution sucks.


I've used a number of the popular libraries on various projects over the past year, and have yet to find one that "feels right".  They took an incredibly complex problem and made and even more complex solution.  It really shouldn't be this hard.  All I want to do is take a unit of work from my model and kick it off into "magical background job land".  I don't want to create separate "Worker" or "Job" classes which only exist to call back into my model object.  If your background jobs are doing more work than that, you're doing something wrong!


This is the API I want:

```ruby
user = User.new
user.do_stuff_backgrounded
```


This is the contract I envision for enabling background processing:

```ruby
class User
  backgrounded :do_stuff

  def do_stuff
    #long running process here
  end
end
```


I've released a Backgrounded on github at [http://github.com/wireframe/backgrounded](http://github.com/wireframe/backgrounded) as a simple and concise API for invoking background jobs.  It also provides a thin wrapper around the underlying job handler framework to support pluggable implementations.  DelayedJob is supported out of the box, but it's trivial to drop in support for bj, workling, or any other implementation.


Backgrounded also works great in unit tests as well by providing a "synchronous" handler so that your tests don't need to wait for the background work to complete.  No need for Thread.sleep!


I'm excited about this API for a number of reasons.  The meta programming declaration doubles as documentation and makes it very clear what the developer is intending to do.  It also allows for backgrounded internals to declaratively create the backgrounded methods ahead of time and remove the need for ugly "method\_missing" handling.  Yay for clean stacktraces and accurate listing of methods (including IRB method autocompletion)!


DelayedJob supports a slightly similar *alternative* API (ex: User.send\_later(:do\_something)), but their primary usecase revolves around creating a secondary Job class to perform your work.  I've thought about forking the delayed job project to support my syntax, but for now I'll leave it as a separate project.  Let me know if there's any interest in having this merged into the core delayed\_job project.
