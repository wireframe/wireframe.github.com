---
layout: post
title: "Send Mail with Backgrounded Mail"
date: 2011-01-18
comments: false
tags:
 - ruby
 - backgrounded
 - email
 - opensource
---

[](http://1.bp.blogspot.com/_yocpuDtbm4c/TTZ3K2kg0MI/AAAAAAAAABc/2qB_m-gopNE/s1600/mailroom_sendmail.jpg)

This is what life was like before backgrounded\_mail...


Don't tie up your precious resources blocking on a synchronous call to sendmail or SMTP!  Use the [backgrounded\_mail gem](https://github.com/wireframe/backgrounded_mail) to make your application more responsive and deliver email using your background processing library.


The background\_mail API is very straightforward.  Instead of invoking 'deliver' on the mail object, simply use the 'deliver\_backgrounded' method to push the email into your background processing queue.

ex:

```ruby
UserNotifier.welcome(user).deliver_backgrounded
```


The backgrounded\_mail gem is compatible with Rails3 or any project using the [mail gem](https://github.com/mikel/mail).  It is built on the world class [backgrounded library](https://github.com/wireframe/backgrounded) to enqueue email delivery using your background processing library of choice (ex: resque, delayed job, workling, etc).


Sourcecode is available on Github.

[https://github.com/wireframe/backgrounded\_mail](https://github.com/wireframe/backgrounded_mail)
