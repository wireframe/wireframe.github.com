---
layout: post
title: "Rails console tweaks gem"
date: 2012-03-24
comments: false
tags:
 - ruby
 - rails
 - opensource
---

Every developer toolbox has a certain set of tweaks for use in the Rails console.
There is [no](http://stackoverflow.com/questions/4774847/rails-console-tips-tricks-and-customizations)
[shortage](http://rors.org/2009/12/20/10-rails-console-tricks.html)
[of](http://rors.org/2011/07/17/inline-logging-in-rails-console.html)
[blog](http://rbjl.net/49-railsrc-rails-console-snippets)
[posts](http://drnicwilliams.com/2006/10/12/my-irbrc-for-consoleirb/) for customizing your Rails console.
However, there is still a considerable gap in tooling to simplify the experience.
The Rails console tweaks gem is a solution to help you bootstrap a new app and get the best
default console experience right out of the box.

Just drop this gem into your Rails application Gemfile and watch the magic happen the next time you open your Rails console!

```ruby
# Gemfile
gem 'rails-console-tweaks'
```

SQL Logging
===========

By default, all SQL statements executed in the console will be logged to standard out. This is invaluable when debugging applications in order to inspect what SQL is being executed during an action.

Bundler Console Group
=====================

The Rails console tweaks gem autoloads any gems defined in the consolebundler group which makes it easy to plug in new fancy console tools as they are released. Creating a separate bundler group has the added benefit that these debugging tools will not be exposed to your standard production environment. Using custom bundler groups is slowly becoming a best practice for grouping related gems for several reasons such as: [speed, safety, clarity](http://iain.nl/getting-the-most-out-of-bundler-groups).

```ruby
# Gemfile

gem 'rails-console-tweaks'

# any gems in this group are only available
# within the rails console
group :console do
  gem 'wirb'
  gem 'hirb'
  gem 'awesome_print'
end
```

HIRB/WIRB Integration (optional)
================================

If you use the HIRB or WIRB ruby gems in your application, the Rails console tweaks gem will auto-enable the gems to customize your console output.

The [Rails console tweaks](https://github.com/wireframe/rails-console-tweaks) gem is 100% opensource and any comments or suggestions are welcome!

