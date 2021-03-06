---
title: "Automatically prefix email subject with Rails env"
tags:
  - ruby
  - rails
  - opensource
  - protip
---

One trick I've used across multiple projects to help manage
email overload is to add a standard subject prefix to all outgoing
emails that contains the specific application/service along with the
Rails env for non-production environments (ex: staging, demo, etc).

For example:

```
# subject for MyApp from staging
[MyApp STAGING] Forgot Password

# subject for MyApp from production
# Rails.env omitted to keep emails pretty for users
[MyApp] Forgot Password
```

This simple change makes it much easier easier to visually scan incoming
emails and even simpler to setup effective email filters.  All good
things to reduce email overload.

### ActionMailer::Interceptor to the rescue

Rails 3.1 and above have a great feature that allow for intercepting
all outgoing email and optionally modifying the mail object before it is
delivered.  I've used a [pretty simple interceptor](https://coderwall.com/p/qtsxug/prefix-all-emails-with-application-name-and-rails-env)
across several projects to add a standard subject prefix and have been very happy with the results.

Now, after several iterations I have finally gotten around to
wrapping this behavior up into a standalone gem.

The [email_prefixer gem](https://github.com/wireframe/email_prefixer)
encapsulates this functionality and is absolutely simple to get up and running.
Literally `bundle install` and your done.

### Customizing the application name

The `email_prefixer` gem automatically infers the application name from the
Rails application class name, but this can be changed using a standard Rails config initializer.

For example:

```ruby
# config/initializers/email_prefixer.rb
EmailPrefixer.configure do |config|
  config.application_name = 'MyCompany'
end
```

### Feedback wanted

Are there other customizations that would be useful?  I'd love to hear
any feedback or suggestions for improvements!
