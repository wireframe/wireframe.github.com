---
layout: post
title: "Guard JSLint on Rails Released!"
date: 2011-09-14
comments: false
tags:
 - ruby
 - javascript
 - testing
 - opensource
---

[](http://4.bp.blogspot.com/-87kA7x9PKz8/TnFuNzks7jI/AAAAAAAAADA/ihGp062mQu0/s1600/HolyGrail117_edit.jpg)

Continuous testing has changed my life and [Guard](https://github.com/guard/guard) is top dog when it comes to continuous testing for Rails development.  It's simple, reliable and [extremely easy to extend](https://github.com/guard/guard/wiki/List-of-available-Guards).  [Autotest](http://www.zenspider.com/ZSS/Products/ZenTest/) and [Watchr](https://github.com/mynyml/watchr) don't hold a candle to Guard.

It is imperative when building Javascript heavy applications that you add [JSLint](http://jslint.com/) to your workflow.  The excellent [jslint-on-rails gem](https://github.com/psionides/jslint_on_rails) makes it absolutely trivial, so if you haven't done so already, do it now!  (Don't worry.  I'll wait for you.  Seriously, it only takes a few minutes.)

Some people whine and complain that [JSLint is evil](http://webreflection.blogspot.com/2010/02/jslint-bad-part.html) and there may be some legitimacy to that claim, but the simple fact is that JSLint has saved my ass more than once.  Before JSLint, a single missing semicolon would take down an entire application for IE6/7 users, but ever since we've introduced JSLint into our development flow, we've had zero issues.

Integrating JSLint into your continuous testing flow is now possible with the new [guard-jslint-on-rails plugin](https://github.com/wireframe/guard-jslint-on-rails).  Catch those pesky lint issues before you deploy to production.  Catch them even before your continuous integration process runs.  Heck, now you'll catch them before you commit them to your version control repository!


###  First: install the gem...

```
$ gem install guard-jslint-on-rails
```



###  Next: configure guard...

```
$ guard init jslint-on-rails
```


And voila!  Each time you tweak your Javascript files, your changes will be validated against your JSLint config!
