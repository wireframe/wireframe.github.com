---
layout: post
title: "Backgrounded 0.3.0 Released"
date: 2009-08-18
comments: false
tags:
 - ruby
 - backgrounded
 - opensource
---

The [initial release of Backgrounded]({% post_url 2009-07-22-backgrounded-background-processing-done %}) seems to have struck [a chord](http://www.rubyinside.com/backgrounded-a-simple-wrapper-for-ruby-background-tasks-2100.html) with [the Ruby community](http://railsenvy.com/2009/8/5/rails-envy-podcast-episode-089-08-05-09) and it appears to be gaining momentum. The response has been very positive, but there has been some confusion on why Backgrounded exists I'd like to take a moment to clarify that.


API Above All
-------------

The API for calling background jobs needs to be clear and concise. No extra Worker/Job classes, and the method signature for invoking background jobs needs to make sense.


The optional delayed\_job API is okay, but not great. It is nowhere near as usable as as the Backgrounded syntax. 

```ruby
#delayed_job API
MyObject.handle_asynchronously(:my_action)
```


Workling's implementation is workable (pun intended), but not ideal either. I constantly find myself wondering if the method name starts with "async" or "asynch" and the lack of method completion (due to method\_missing usage) makes this problem even worse.

```ruby
#workling API
MyObject.async_my_action
```


The Backgrounded API is an evolutionary API inspired by these other implementations. After several iterations, the Backgrounded API was born as the definitive implementation for clear and concise invocation.

```ruby
#Backgrounded API
MyObject.my_action_backgrounded
```


Testability
-----------

The vast majority of background processing libraries I've worked with have not been particularly good about integrating with unit tests. Maybe their recommended best practice is to not unit test background jobs, but that's not exactly a good idea. Backgrounded integrates smoothly with testing environments by running background operations synchronously which means you can perform assertions without jumping through hoops or waiting for background operations to complete.


Portability
-----------

You should be able to swap in a new background processing framework with no changes to your code.  Backgrounded is an extremely thin wrapper around any backend processing framework and should work seemlessly with whatever implementation you choose (DelayedJob, JobFu, Workling, etc). DelayedJob and JobFu work out of the box and It's extremely easy to implement your own handler for other libraries.

```ruby
# config/initializers/backgrounded.rb
class MyHandler
 def request(object, method, *args)
   #process the call however you want!
 end
end

Backgrounded.handler = MyHandler.new
```


[Jon Stenqvist](http://github.com/jnstq) stepped up to the plate this last week and knocked out a few awesome additions to Backgrounded. Major props to Jon for the patches and to Github for making it so damn easy to integrate his changes into the codebase.


Backgrounded now supports passing method parameters to your async operation which should make it even easier to integrate Backgrounded into your project since you shouldn't need to change method signatures. You should be aware that your method parameters will be marshaled and unmarshaled in order to pass the arguments to the separate process which may have some side effects if you're passing around complex objects. In my experience, it is best to either use no-argument methods or use simple data types and avoid passing entire serialized objects. This is the same advise used when [storing information in your HTTP session](http://railscasts.com/episodes/13-dangers-of-model-in-session).

```ruby
#Backgrounded now supports method params!
MyObject.save_username_backgrounded('new username')
```


Jon also added first class Backgrounded support for the [JobFu library](http://github.com/jnstq/job_fu/tree/master) which is an alternative to DelayedJob. I haven't played around with JobFu yet, but I'm excited at how easy it was for Jon to integrate JobFu with Backgrounded. It just goes to show how trivial it is to write a custom handler for processing background events. If anyone else would like to contribute an extension, let me know!


The new JobFu contribution leads me to my next question, what is the best way to distribute the Backgrounded handlers for various frameworks? JobFu does an *excellent* job by packaging the handler directly with their plugin, but not all frameworks will follow that lead. Would it be most beneficial to have each implementation as a separate gem (ex: workling-backgrounded, delayed\_job-backgrounded, etc), or include each implementation directly with the backgrounded core (like delayed\_job currently is)? I'm personally leaning towards having separate gems for each integration which would allow for a quicker release schedule and lower barrier to entry for new integrations. Any thoughts?


With the 0.3.0 release now out the door, it's time to look forward. Coming soon to Backgrounded...background ActionMailer delivery. Stay tuned!
