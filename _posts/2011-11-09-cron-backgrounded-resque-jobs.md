---
layout: post
title: "Cron Backgrounded Resque Jobs"
date: 2011-11-09
comments: false
categories:
 - ruby
 - backgrounded
 - resque
---

[](http://www.flickr.com/photos/jeremy-g/1512405671/)

[Cron](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/crontab.html)is still the de facto standard when it comes to scheduling execution of jobs. It does one thing, and it does it well.

Using cron to fire off heavyweight Ruby/Rails jobs is fairly trivial to get up and running. When each cron job fires up a full Rails process, it won't be long until you accrue enough jobs that your cron server will be brought to it's knees. Since you already have a pool of [Resque](http://github.com/defunkt/resque) background workers running to process async jobs, why not leverage dormant workers to process jobs that are kicked off via cron?

Here is a simple solution that can be used to have cron enqueue jobs into [Backgrounded Resque jobs](http://blog.codecrate.com/2010/09/backgrounded-resque-support.html)without loading the entire Rails environment.

This is an excellent optimization to increase the availability of your cron server and avoid running out of memory when multiple jobs fire up at the same time.

crontab invocation:

```
script/backgrounded enqueue Foo.bar --queue baz
```

[script/backgrounded](https://gist.github.com/1351867):
```ruby
#!/usr/bin/env ruby
require 'rubygems'
require 'thor'

module Backgrounded
  class CLI
    desc 'enqueue', 'enqueue a clazz.method invocation for resque backgrounded workers'
    method_option :queue, :aliases => "-q", :desc => "resque queue to enqueue the operation to", :default => 'backgrounded'
    method_option :rails_env, :aliases => '-e', :desc => 'control which rails env used to load the redis config', :default => 'production'

    # operation Clazz.method to enqueue into resque backgrounded queue (ex: Foo.bar)
    def enqueue(operation)
      require 'bundler'
      Bundler.setup
      require "thread"
      require "active_support/inflector"
      require "resque"
      require "yaml"

      clazz, method = operation.to_s.split('.')
      raise 'invalid operation' unless clazz && method
      Resque.redis = YAML.load_file(File.join("config", "resque.yml"))[options[:rails_env]]
      Resque::Job.create(options[:queue], 'Backgrounded::Handler::ResqueHandler', clazz, -1, method)
    end
  end
end

Backgrounded::CLI.start
```
Use cron for it's excellent scheduling capabilities and take advantage of your background processing infrastructure to handle the incoming request!