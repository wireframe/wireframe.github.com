---
layout: post
title: "FactoryGirl RSpec Traits"
categories:
 - ruby
 - rspec
 - testing
---

[FactoryGirl traits](http://robots.thoughtbot.com/post/23673635798/remove-duplication-with-factorygirls-traits) are a great way to encapsulate a set of properties into convenient and meaningful names.  Using traits effectively is a simple way to drastically improve the expressiveness of your specs.

The 2.0 release of the [FactoryGirl RSpec gem]({% post_url 2011-10-04-cleaner-rspecfactorygirl-integration %}) includes [a major change that now treats traits as first class citizens](https://github.com/wireframe/factory_girl_rspec/pull/4).  When you instantiate a FactoryGirl object instance with traits, the FactoryGirl RSpec gem will now *automatically* name your local variable to include the traits as part of the variable definition.


```ruby
describe User do
  describe '#some_method' do
    with :user, :without_first_name
    it 'works as expected' do
      # notice the variable name includes the trait!
      user_without_first_name.some_method
    end
  end
end
```

Keeping your variable names in sync with the declared factory/traits makes your specs much more *expressive*.  This also means it is now possible to write a spec that relies on multiple instances of the same factory, and each instance can have different traits.

```ruby
describe User do
  describe '#some_method' do
    with :user, :without_first_name
    with :user, :without_last_name
    it 'works as expected' do
      # notice each instance maps to the proper set of traits!
      user_without_first_name.some_method
      user_without_last_name.some_method
    end
  end
end
```

After using this change, it's hard to imagine ever going back to a test suite that uses *generic* variable names for the instantiated factory objects.
