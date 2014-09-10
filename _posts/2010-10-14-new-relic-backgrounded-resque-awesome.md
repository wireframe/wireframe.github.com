---

title: "New Relic + Backgrounded + Resque = Awesome"
date: 2010-10-14
comments: false
tags:
 - ruby
 - performance
 - backgrounded
 - resque
 - opensource
---

If you're writing a rails app, you're already using new relic to monitor your app right? Wouldn't it be great to get the same performance monitoring of your Backgrounded operations as well?


Fork it up, now you can!


I've published a fork of the rpm\_contrib gem that will automatically instrument and monitor your Backgrounded operations with absolutely **no** code changes! That's right, all you need to do is include the wireframe-rpm\_contrib gem and your Backgrounded Resque tasks will automatically be tracked!


Sourcecode available on github (fork of [rpm\_contrib](http://github.com/newrelic/rpm_contrib)):

[http://github.com/wireframe/rpm\_contrib](http://github.com/wireframe/rpm_contrib)


Gem available on gemcutter:

[https://rubygems.org/gems/wireframe-rpm\_contrib](https://rubygems.org/gems/wireframe-rpm_contrib)


The default rpm\_contrib gem adds instrumentation for Resque jobs, but is not aware of Backgrounded jobs so all of the jobs were recorded as Backgrounded::Handler::ResqueHandler#perform. My little patch fixes that so that Backgrounded Resque jobs have the correct classname/method context.

