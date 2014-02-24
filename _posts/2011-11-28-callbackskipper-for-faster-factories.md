---
layout: post
title: "callback_skipper for faster factories"
date: 2011-11-28
comments: false
tags:
 - ruby
 - performance
 - rails
 - testing
 - opensource
---

[](http://www.flickr.com/photos/brentbat/2137221211)

The Rails community has taken a strong stance that [test fixtures are evil and factories are the new hotness](http://railscasts.com/episodes/158-factories-not-fixtures). The most compelling reason for this shift being that factories greatly reduce maintance costs as your application grows over time.

The largest drawback when replacing fixtures with factories is the additional performance overhead when initializing your test state. This is due to the fact that factories utilize the full ActiveRecord lifecycle (initialize object, validate, save to database) compared to fixtures which are a glorified database bulk import which bypass object creation/validation.

Take this example ActiveRecord model and testcase (using [FactoryGirl](https://github.com/thoughtbot/factory_girl) factories):

```ruby
class Foo
  after_create :do_something_expensive
end

def test_new_instance_has_bar
 foo = Factory.create :foo
 assert foo.bar?
end
```

This is a classic example where using factories will be much slower than fixtures. It may not seem like a big deal, but it becomes a real issue when you have a sizable application testsuite, and I'm a firm believer that if a testsuite isn't fast, it doesn't get run.

Sending email with after\_save callback is another great usecase. How can we get the benefits of factories without the additional overhead? Can we have our cake and eat it too?

Since 99% of our testcases rely on the basic factory instance and are not dependent upon the expensive callback being fired, it would be ideal to skip the expensive callback for most of your testcases and only fire it for testscases that are explicitly asserting it's behavior.

The newly released [callback\_skipper gem](https://github.com/wireframe/callback_skipper) fulfills this exact usecase. The goal is to make it trivial to skip a particular model callback for a specific instance. This is a homerun for test factories to setup a default factory which skip non-critical callbacks and still have the flexibility to create a factory that _does_fire the slow-ass callbacks for specific tests.

```ruby
# spec/factories/foo_factory.rb
Factory.define :foo do |f|
 f.after_build do |o|

 o.skip_callback :save, :after, :do_something_expensive
 end
end

Factory.define :foo_with_expensive_callback, :class => 'Foo' do |f|
end
```

Oh yes, we _can_ have our cake and eat it too...

The callback\_skipper gem is equivalent to the core [ActiveRecord.skip\_callback](https://github.com/wireframe/callback_skipperhttp://api.rubyonrails.org/classes/ActiveSupport/Callbacks/ClassMethods.html#method-i-skip_callback) method with the added benefit of only skipping the callback for a specific instance instead of globally for all invocations.

As always, the gem is 100% opensource and suggestions are welcome!

