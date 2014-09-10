---

title: "Backgrounded 2.0 Beta"
date: 2012-05-22
comments: false
tags:
 - ruby
 - backgrounded
 - rails
 - opensource
---

[Backgrounded](http://github.com/wireframe/backgrounded) 2.0 beta is now available with some really exciting changes. I've taken this release as an opportunity to critically evaluate the perfect API for invoking background jobs. The new API is _not_backwards compatible with previous versions, but it is SEXY as HELL!

```ruby
class User
 # instance method to do some stuff
 def do_stuff
 end

 # class method to do something else
 def self.do_something_else
 end
end

# execute class method in background
User.backgrounded.do_something_else

user = User.new
# execute instance method in background
user.backgrounded.do_stuff
```

Oh snap...Did you see what happened there? I just ran class and instance methods in the background with **no** code changes whatsoever! This new API allows for _any_method on _any_ruby object to be executed in the background. But that's not all! The new API also simplified passing custom options into the background handlers (which is awesome for resque users).

```ruby
# execute instance method on a custom resque queue
user.backgrounded(:queue => 'custom').do_stuff
```

It's glorious...

Extension Gems
--------------

One of Backgrounded's core missions is to be a simple and lightweight wrapper around _any_ background processing framework. With this release, I've decided to extract logic for each library into separate gems. This helps simplify the core testsuite and makes it more extensible in the long run to release updates to specific libraries without bumping the core library version.

The [backgrounded-resque gem is now available on github](http://github.com/wireframe/backgrounded-resque).

### Bundler config

```ruby
gem 'backgrounded-resque'

```
If any other developers are interested in building a backgrounded wrapper, spin up a gem and drop me a line!

after\_commit\_backgrounded Callback
------------------------------------

Using ActiveRecord callbacks to perform background work is an
[extremely common pattern]({% post_url 2009-10-29-backgrounded-activerecord-callbacks %}).
Background jobs should only be invoked after the data has been committed to the database to
ensure that the background job will have access to the recent changes and
backgrounded now makes it even easier to do the "right thing".

The after\_commit\_backgrounded callback is just like your standard [Rails after\_commit hook](http://api.rubyonrails.org/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_commit) with a few minor upgrades. It executes the referenced method in the background (duh), and it allows for an optional :backgrounded option to customize the options for the Backgrounded::Handler.

```ruby
class User  # execute :do_something in the background
 after_commit_backgrounded :do_something

 # execute :do_something_else in the background
 # passing custom options to the backgrounded handler
 after_commit_backgrounded :do_something_else, \
   :backgrounded => {:priority => :high}
end
```
Grab the latest beta version via rubygems and send any feedback my way!

```
gem install backgrounded --pre
```
