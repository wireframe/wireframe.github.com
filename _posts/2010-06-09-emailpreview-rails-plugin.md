---

title: "email_preview Rails Plugin"
date: 2010-06-09
comments: false
tags:
 - ruby
 - email_preview
 - rails
 - opensource
---




As a developer, working with email pretty much sucks. Crafting emails is a time consuming task where you constantly refine and tweak markup to get the **perfect** layout for your message. Heck, it's easier to do cross browser testing of your application for IE6!


The email\_preview engine is a new Rails 3 plugin I've released to help developers build kick ass emails for your Rails 3 app. It provides a quick and easy way to preview sample emails from within your web browser and see how they will look in the end user's email client.


The developer API is extremely simple. You can use the standard Rails ActionMailer interface to configure each instance, or manually configure each email using the excellent [mail library](http://github.com/mikel/mail).


#config/email\_preview.rb

```ruby
EmailPreview.register 'user activation email' do
  u = User.new :email => 'foo@example.com'
  UserNotifier.activation
end


EmailPreview.register 'simple example email' do
  Mail.new do
    to 'tom@example.com'
    from 'me@foo.com'
    body 'check this out'
  end
end


EmailPreview.register 'multipart email (html + text)' do
  Mail.new do
    from 'mikel@test.lindsaar.net'
    to 'you@test.lindsaar.net'
    subject 'This is a test email'

    text_part do
      body 'This is plain text'
    end

    html_part do
      content_type 'text/html; charset=UTF-8'
      body '<h1>this is HTML</h1>'
    end
  end
end
```


Once you've configuring your sample emails, startup your Rails 3 application and preview them in any web browser at [http://localhost:3000/email\_preview](http://localhost:3000/email_preview). All email templates are re-rendered with each request so you can tweak/save/refresh to instantly preview how your emails will look for your users. Talk about quick turnaround time!


Need more assurance that your emails will look correct? If your dev environment is configured to send emails, you can send any of your email previews to your inbox by filling out the convenient form at the top of each page.


This plugin is 100% opensource and the code is available on github at [http://github.com/wireframe/email\_preview](http://github.com/wireframe/email_preview). Patches are *always* welcome, and if you have any questions or suggestions, please drop me a line.
