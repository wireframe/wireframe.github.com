---
title: "The Toolbox Bundler Group"
tags:
 - ruby
 - rails
 - protip
---

There are many Ruby gems that provide commandline interfaces that are useful for development tasks.
[The Garage Git eXtensions gem](http://github.com/thegarage/thegarage-gitx) is a good example of a CLI
application that adds additional Git subcommands for common development workflows and there are numerous
other gems that provide functionality ranging from
[interacting with third party services](https://github.com/travis-ci/travis.rb) to
[simplifying tedious jobs](https://github.com/copiousfreetime/launchy).

### The Easy Button

[Bundler](http://bundler.io/) makes distribution of these utility gems to your entire team super easy
by just adding a few lines to your Gemfile.  All your developers will have access to the tools they need
right out of the box, and you have a simple way to rollout new gem versions over time as well.

Since these gems are primarily developer utilities, you **may** be tempted to save these gems in
your `:development` Bundler group...but **STOP**!

**These are tools...not libraries!**

```ruby
group :development do
  # FIXME!
  # This actually loads thegarage/gitx.rb source
  # into your application runtime
  gem "thegarage-gitx"
end
```

By default, every gem declared in the `:development` group is **automatically loaded
during application initialization which means that all Ruby files within those gems
will be included into your application**.  Not only does this bloat your
application's runtime environment, but it also has potential for nasty and unexpected
side-effects when the gem's CLI source code, monkeypatches, and all dependency gems
are loaded into your running application. This is so bad that some CLI gems have
started to [recommend against including the gem in your Bundler Gemfile](https://github.com/ddollar/foreman/commit/fe0d953a2858e2cddacc9a3aa54935d170caceda).

Can we get the benefits of simplified cross team distribution of the toolset
gems provided by Bundler *and* avoid polluting our Ruby runtime environment
with the code from these gems?

*Of course we can!*

### Bundler :require Flag

Bundler actually supports the ability to opt-out of the auto-loading behavior by passing
[an optional `require: false` flag for any gem in your Gemfile](http://bundler.io/v1.6/gemfile.html
).

```ruby
group :development do
  gem "thegarage-gitx", require: false
end
```

This solves the immediate issue, but it is quite a manual process to add this option to every gem.
As your project grows, it is also quite easy to overlook the optional flag and accidentally
add a new gem that will get included into your runtime.  Any other options?

### The :toolbox Bundler Group

[Custom Bundler groups are an extremely effective way to group related gems into unique buckets]({% post_url 2012-05-03-bundler-nirvana-with-custom-groups %}).
Let's create a new custom group and shove all of these gems into an aptly named `:toolbox` group.

```ruby
group :toolbox do
  gem "thegarage-gitx"
  gem "bundler-reorganizer"
  gem "foreman"
  gem "travis"
end
```

*Perfect!*  [Bundler only loads a set of known groups](http://bundler.io/v1.6/groups.html)
into the running application, so any gem listed in the `:toolbox` Bundler group will
**not** be automatically loaded during Rails startup.  We **also** have an
expressively named set of gems that is easily identifiable for future additions!

NOTE: You can *actually* give your `:toolbox` group any name that you see fit as long as it is
**not** one of [the default groups loaded by Bundler](http://bundler.io/v1.6/groups.html).

### [optional] Exclude Gems From Production Deployments

Since these toolbox gems are primarily used for development purposes, you may
want to exclude these gems from being installed on production machines.
[Bundler makes this process very straightforward](http://bundler.io/v1.6/groups.html)
via the `bundle install --without` command or the `BUNDLE_WITHOUT` environment
variable.  Production deployments typically exclude the `development` and `test`
groups by default, so you just need to add the `toolbox` group to the list as well.

```bash
$ export BUNDLE_WITHOUT="development:test:toolbox"
```

If you’re deploying to Heroku, [checkout their documentation for configuring environmental variables](https://devcenter.heroku.com/articles/bundler).
