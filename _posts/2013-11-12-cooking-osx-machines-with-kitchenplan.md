---
layout: post
title: "Cooking OSX Machines with Kitchenplan"
date: 2013-11-12
tags:
  - osx
  - chef
  - kitchenplan
---

> Provisioning a new OSX machine is a chore, and time is the one thing we never have enough of...

[Chef](http://www.opscode.com/chef/) has made setting up production servers trivial.  Why not use Chef to automate setting up your development environment in a standard and reproducible way?

# Kitchenplan to the rescue


[Kitchenplan](http://vanderveer.be/blog/2013/04/14/presenting-kitchenplan/) is a brilliant tool for packaging up Chef recipes to setup and configure OSX/Linux environments.  It's the perfect tool to automate building out a team's standard development environment.

Creating your own stack is as simple as following a few steps:

1. Fork the [kitchenplan github repo](https://github.com/thegarage/kitchenplan/)
2. Customize your list of Chef recipes in `config/default.yml`
3. Provision your machine using the awesome installer script (inspired by [Homebrew](https://raw.github.com/mxcl/homebrew/go) and [written by yours truly](https://github.com/kitchenplan/kitchenplan/pull/33))


The installer script takes you from zero to hero in one line.  There's literally nothing else you need to do to get up and going.  The installer script even takes care of **automatically installing Xcode Command Line Tools**!

```
    # configure location of custom kitchenplan repository
    $ export KITCHENPLAN_REPO=https://github.com/mycompany/kitchenplan.git

    # install/update kitchenplan recipes and run chef
    $ ruby -e "$(curl -fsSL https://raw.github.com/kitchenplan/kitchenplan/master/go)"
```

## Re-runnable
We all know that provisioning your development environment is *not* a one time ordeal.  We **constantly** tweak and change our environments as new tools/technologies become available.  Kitchenplan (and Chef) support this flow incredibly well, and you can re-run kitchen plan anytime to update your local environment with new configuration or recipes.  The installer script will actually automatically update an existing installation with the latest available configuration in the remote repository for you.

## Flexibile
Kitchenplan has an elegant set of configuration files that supports global as well as per-user level recipes/attributes.  It also supports extracting common sets of settings and recipes into "groups".  Here's an [example config for my current machine](https://github.com/thegarage/kitchenplan/blob/master/config/people/ryansonnek.yml) that adds additional recipes and customized attributes.

I spent some time exploring [Pivotal sprout](https://github.com/wireframe/chef-osxbootstrap) as an alternative to kitchenplan, but it's lack of groups and limited local user customizations really make kitchen plan shine here.

# Building your [Kitchen]plan

There are **lots** of recipes to choose from to build your kitchen plan config, and it can be overwhelming to know where to start.  I've found the best place to start is to cherry-pick recipes one at a time instead of trying to import a whole slew of recipes and weed through which ones are relevant.

In general, you can group your recipes into one of these three categories:

## OSX system configuration

These settings range from [trivial tweaks to OSX Finder](https://github.com/thegarage/chef-osxdefaults/blob/master/recipes/finder_display_full_path.rb) to [security related settings to ensure machines prompt for passwords after idle for an extended period of time](https://github.com/thegarage/chef-osxdefaults/blob/master/recipes/set_screensaver_preferences.rb).

The [chef-osxdefaults cookbook](https://github.com/kitchenplan/chef-osxdefaults) is a highly recommended starting point for these recipes (contributions welcome).

## Application installation

[Homebrew](http://brew.sh) and [homebrew cask](https://github.com/phinze/homebrew-cask) are absolutely awesome and have pretty much cornered the market for installing apps on OSX.  Luckily, the [chef-applications cookbook](https://github.com/kitchenplan/chef-applications) is smart enough to leverage homebrew and homebrew cask under the covers and delegate to those existing libraries instead of re-inventing the wheel.

Pretty much every recipe I needed to get up and running was already available right out of the box (and contributions are always welcome).

## User environment
Building the perfect shell environment takes a **long** time and I've invested a ton of time in [my personal dotfiles](https://github.com/wireframe/dotfiles
).  Building out a sweet shell config with kitchen plan is completely possible, especially if you feel comfortable hopping in and creating a few simple recipes for [bash-it](https://github.com/revans/bash-it) extensions.

[the chef-dotfiles cookbook](https://github.com/thegarage/chef-dotfiles) has done a good job here as well getting a basic shell environment up to snuff and on par with my old custom dotfiles configuration (yep, contributions are encouraged).

# Remodeling starts today

Creating a custom kitchenplan is an easy way to pay it forward and give your "future self" a few extra hours of productivity when you have to setup that next development environment.
