---

title: "Bundler Nirvana With Custom Groups"
date: 2012-05-03
comments: false
tags:
 - ruby
 - rails
---

Managing gem dependencies in Rails applications has been an ongoing struggle over the years. Anyone out there still remember vendoring and freezing gems/plugins into their application? Ah yes, the good old days. Thank goodness for [bundler](http://gembundler.com/). For all of it's warts, it's an exceptional piece of software and has made my life _infinitely_ better.

The basics of bundler are all well and good, but my goal here is to take your bundler-fu to the next level.

The Problem
-----------

As applications grow, managing your Gemfile dependencies is an ongoing issue. The number of dependencies grows...and grows...and grows, until you are no longer able to grok what your application needs to get up and running with a simple visual scan.

Enter Custom Bundler Groups!
----------------------------

Inspired by the great article by [Iain Hecker](http://iain.nl/getting-the-most-out-of-bundler-groups),
I began exploring more advanced usage of bundler groups.
The [rails-console-tweaks gem]({% post_url 2012-03-24-rails-console-tweaks-gem %}) was a step in the right direction,
but there's plenty more work to be done!

After launching a few Rails applications from the ground up, I found a number of reusable themes that could be expressed quite well using bundler groups.

At a minimum, a basic Rails application should have a bundle group for each of these areas:

  - :app - gems for front end appservers (ex: rack middleware)
  - :worker - gems for resque backend processing jobs (ex: resque-ensure-connected)
  - :console - gems for firing up a rails console (ex: hirb, awesome\_print)
  - :development - gems for day to day development tasks (ex: email\_preview, mailcatcher, etc)
  - :test - gems for running testcases (ex: rspec, webmock, etc)
  - :debug - gems for firing up the debugger (ex: pry)
  - :darwin/:linux/etc - gems specific to your particular OS (ex: growl) (might be improved at some point see https://github.com/carlhuda/bundler/issues/663)
  - :ci - gems for running continuous integration by automated build processes (ex: jslint)
  - :ct - gems for continuous testing workflow (ex: guard, autotest, etc)

[An example annotated skeleton Gemfile is available in this Gist.](https://gist.github.com/raw/2589028/a03f649b838fc9e4ecf93a3a239cac37d111e9da/Gemfile)

Adding these specialized bundler groups gives your app an instant boost in:

  - Clarity - Each of these self describing groups will help avoid paralysis when you get 100+ gems in your app
  - Speed - I've personally seen a 500ms difference in application startup time for even a simple usecase. Every little bit helps!
  - Safety - Isolating non-prodution gems from your production environment.

Putting the pieces together...
------------------------------

Once you have grouped your gem dependencies, the next step is to ensure that the proper groups are loaded in the proper places.

### Rails Application Config

The Rails application.rb config file is used to declare which custom groups are loaded based on the current Rails environment (production, development or test). In our configuration, we want to ensure that the debug gems are loaded into our development and test environments.

### Rack Appserver Config

The appserver specific gems are autoloaded using the Rack config.ru configuration file by configuring the standard RAILS\_GROUPS environment variable. It's a simple and elegant solution.

### Resque Background Job Config

Autoloading gems into your background workers can also easily be done by passing the RAILS\_GROUPS config to your resque workers.

```
$ RAILS_GROUPS=worker QUEUES=* RAILS_ENV=production rake resque:work
```

### Capistrano Deployment Config

It's important to make sure that these development and test gems are excluded from your production environment. It's quite easy to tweak the Rails default capistrano deployment task to exclude additional custom groups

Versioning Best Practices
-------------------------

When building your Gemfile, It's important to lock down **all** production gems with a **STRICT** version requirement (ex: "1.0.0"). This prevents a careless developer from running "bundle update" and pulling in gems that are not fully tested. On the other hand, it is highly recommended to use a **LOOSE** version requirement for development and test gems to easily upgrade to the bleeding edge version (ex: "~> 1.0.0").

A full list of all files referenced in this post can be found [in this Gist](https://gist.github.com/2589028). Comments and suggestions are always welcome!

