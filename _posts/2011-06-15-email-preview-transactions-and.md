---
layout: post
title: "Email Preview + Transactions and Factories"
date: 2011-06-15
comments: false
categories:
 - ruby
 - email_preview
 - rails
 - email
---

[](http://www.flickr.com/photos/pacdog/4968422200/)


The [email\_preview](http://github.com/wireframe/email_preview) gem has undergone a serious overhaul in the last week. After some extensive real-world project use, a new version has been released with some major improvements.


 Transactional Fixtures
-----------------------


At a high level, email\_preview fixtures are very similar in nature to Rails test fixtures. They are a snapshot of data with a particular configuration and are not intended to be long lived outside of the email\_preview. The setup and teardown of previewed emails should follow the same setup/teardown of fixture data used during unit testing. Now each email\_preview action is wrapped in a database transaction and rolled back after completion to avoid polluting your sandbox with unnecessary data!


```ruby
# config/initializers/email_preview.rb
EmailPreview.register 'User activation email' do
  u = User.create :email => 'foo@example.com'
  UserMailer.activation(u)
end
```


 Factories
----------


Why duplicate the setup of fixture data when building your email preview templates? You already use a factory library for your unit tests right? The email\_preview gem now works great with any factory framework you choose ([FactoryGirl](https://github.com/thoughtbot/factory_girl), [Machinist](https://github.com/notahat/machinist), etc).


```ruby
# config/initializers/email_preview.rb
# example FactoryGirl fixture
EmailPreview.register 'User activation email' do
  u = Factory.create :user
  UserMailer.activation u
end
```


 Categories
-----------


Email is still a critical component of most web applications, and it's very easy to rack up lots of templates when working with a large application. To help organize your fixtures, you can now use an optional :category option to group related fixtures.


```ruby
# config/initializers/email_preview.rb
EmailPreview.register 'User activation email', :category => :user do
  u = User.new :email => 'foo@example.com'
  UserMailer.activation(u)
end
```


The email\_preview UI received a considerable overhaul as well and any suggestions are greatly welcome. A solid update all around, and special thanks go to Lars Klevan for [inspiring](https://gist.github.com/1013155) several of these updates!