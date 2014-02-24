---
layout: post
title: "Replace Rake with Thor"
tags:
 - ruby
 - testing
 - rails
 - opensource
---

Okay, let's be honest, when was the last time you actually wrote a unit test
for a Rake task?  My guess is **NEVER**.

Unit testing Rake tasks is a [pain in the ass](http://robots.thoughtbot.com/test-rake-tasks-like-a-boss) to say the least.
Most developers "work around" unit testing Rake tasks by
extracting logic out of the Rake task and into an actual unit testable Ruby object,
still leaving the actual Rake task untested.  This may be acceptable for
*some* developers, but **any technology that is prohibitively difficult to test
should be a red flag that something is wrong**.  This also can leave
significant coverage gaps if your Rake task is parameterized and requires
any parsing of CLI options.

Now, if you extract logic out of your Rake task and
into a good old *testable* Ruby object, why is the extra boilerplate
(and untested) Rake task even necessary?
Let's get rid of that extra layer of indirection and complexity and simply use [Thor](http://whatisthor.com) instead.

The beauty of Thor tasks is that they are Plain Old Ruby Objects **and**
a Rake-like task runner all in one.  Your tasks are now 100% unit testable
without jumping through hoops, and your code is consolidated into one easily
maintainable location.

Go from this...

```ruby
# Rakefile
task :do_something do
  MyCommand.new.run
end

# lib/my_command.rb
class MyCommand
  def run
    # do something here
  end
end
```

To this...

```ruby
# lib/tasks/my_command.thor
class MyCommand < Thor
  desc 'do_something', 'do some work'
  def do_something
    # do something here
  end
end
```

Seriously, it's that easy.  Life on the Thor bandwagon is great from here on out.
You'll never look back at Rake...until...

## Rails Environment Dependencies

Undoubtedly, there will come a time where you will want to write a Thor task
that relies on your Rails environment.  Seems simple right?  Good old Rake
made it easy:

```ruby
task :do_something => :environment do
  # Rails environment is loaded
end
```

So, how do you do this in Thor?  The [thor-rails gem](http://github.com/thegarage/thor-rails) is my recommended solution.  Include the `Thor::Rails`
module into your Thor command, and the Rails environment will automatically
be loaded just like the Rake `:environment` dependency.

```ruby
class MyCommand < Thor
  include Thor::Rails

  desc 'do_something', 'do some work'
  def do_something
    # Rails environment is loaded and available!
    say Rails.env
  end
end
```

## Gem Extensions

Rake has been around for a **long** time, and the Ruby community
has built a **considerable** [collection of extensions and integrations](http://rubygems.org/search?query=rake).
There were two critical features that needed to be addressed
in order to complete the migration from Rake to Thor...

#### Performance Monitoring (NewRelic)

[NewRelic](http://newrelic.com/) is my goto solution for application
profiling and the
[newrelic-rake gem](https://github.com/flyerhzm/newrelic-rake) has
been an excellent addition to introspect performance of Rake tasks.

The [newrelic-thor gem](https://github.com/thegarage/newrelic-thor)
brings that same profiling support to your Thor tasks with no code
changes.  Can't get much easier then that!

#### Exception Tracking (Honeybadger)

[Honyebadger](http://honeybadger.io/) is an excellent solution
for tracking application exceptions.  They even package tracking
of Rake exceptions right into their core gem.

The [honeybadger-thor gem](https://github.com/thegarage/honeybadger-thor)
adds similar exception tracking to your Thor tasks.  Just drop the
gem into your app and you're set!  Hopefully, this feature will
be [integrated into the core honeybadger gem sometime soon](https://twitter.com/codecrate/status/424034659228340225).

There's simply no excuse to **not** write tests for your code,
and Rake tasks **are** most definitely code.  But instead of delving into
the depths and horrors of **how** to unit test Rake tasks,
my answer is to simply leave your Rake in the yard and use [Thor](http://whatisthor.com).
