---
layout: post
title: "Cleaner RSpec/FactoryGirl Integration"
date: 2011-10-04
comments: false
tags:
 - ruby
 - rspec
 - testing
 - opensource
---

[](http://www.flickr.com/photos/dawilson/3389046866/)

For the past few days, I've been re-thinking how to integrate [FactoryGirl](https://github.com/thoughtbot/factory_girl) fixtures into my [RSpec](https://www.relishapp.com/rspec) tests. The transition from Test::Unit to RSpec has taken me some time and I'm still "Unlearning what I have learned" and adapting to the RSpec way of doing things. It's not that Test::Unit style tests are wrong, it just that I need to think a bit differently in order to take full advantage of the expressiveness of RSpec tests.


One common pattern for Rails application tests is to instantiate fixture data and perform assertions on the instances:

```ruby
describe User do
  context 'basic user' do
    before do
      @user = Factory.create :user
    end

    it { @user.should be_inactive }
    it { @user.should_not be_happy }
  end
end
```


According to [The Anatomy of an Effective Unit Test]({% post_url 2010-12-08-anatomy-of-effective-unit-test %})the before block in this example is playing the role of both fixture setup _and_test execution. The ambiguous definition of the beforemethod is analogous to how horrible it is to use API's with incredibly useful methods such as run or execute. Sure, we know _when_ the block is executed, but method names are key to understanding their purpose as well.


I'm a strong proponent of [expressive method names]({% post_url 2005-02-10-document-code-with-units-of-work %}) as a way to self document your code and that's exactly what we need in this scenario. We need a clear and concise way to encapsulate our fixture data initialization outside of the before method and hook it into the RSpec test lifecycle. This will help remove the ambiguous purpose of the before method in this example.


Luckily, The RSpec DSL can be easily be extended.  The new [factory\_girl\_rspec gem](https://github.com/wireframe/factory_girl_rspec) adds the with method which is a seriously clean and concise DSL for initializing your fixtures:

```ruby
describe User do
  context 'basic user' do
    with :user
    it { user.should be_inactive }
    it { user.should_not be_happy }
  end
end
```


The with method is a simple utility that maps directly to the FactoryGirl fixtures that you have defined for your test environment. Each execution of with will create your fixture instance and define a local method within your test context retrieve the instance. Compare the readability of this test with the previous incarnation. It reads like a story right? Watch out [Cucumber](http://cukes.info/), who needs text processing stories when you've got human readable ruby code!


Deviations of fixture data are extremely common in unit tests as well, and the with method expresses differences in an equally concise manner:

```ruby
describe User do
  context 'user with first_name == "Jim"' do
    with :user, :first_name => "Jim"
    it { user.should be_inactive }
    it { user.should be_happy }
  end
end
```
