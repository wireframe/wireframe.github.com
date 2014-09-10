---

title: "Backgrounded ActiveRecord Callbacks"
date: 2009-10-29
comments: false
tags:
 - ruby
 - backgrounded
 - rails
 - opensource
---

ActiveRecord callbacks are pretty amazing. They are an incredibly useful way to declare
specific behavior that is tied to the lifecycle of your model objects.

One very common pattern is to perform &quot;house keeping&quot; activities when an object is updated.
This could mean anything from updating related model objects to logging or updating usage statistics.
Here's a simple example.

```ruby
class User
  after_create :update_stats

  def update_stats
    # do your heavy lifting here
  end
end
```

The majority of these lifecycle callbacks are not in the critical path for saving
your model object and should be pushed to the background to improve end user response times.
The backgrounded API makes transitioning ActiveRecord callbacks to the background incredibly easy.

```ruby
class User
  backgrounded :update_stats

  after_create :update_stats_backgrounded

  def update_stats
    # do your heavy lifting here
  end
end
```

As a side note, [the backgrounded gem is now available on gemcutter](http://gemcutter.org/gems/backgrounded)
so that we can join the cool kids club!
