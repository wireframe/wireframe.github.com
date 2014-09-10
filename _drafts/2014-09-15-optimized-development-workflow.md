---
title: "Optimized Development Workflow"
tags:
 - opensource
 - development
---

Over the past several years, I have worked to define and refine a software
development process that worked for me and my teams.  It needed to be simple,
flexible and agile to accomodate various usecases yet uncompromising in a set of
fundamental principles.

I started off using [the Git Flow process](http://nvie.com/posts/a-successful-git-branching-model/)
but it didn't take long to realize that the Git Flow process was not meant for
our team.  It was [simply too complex](http://www.frenck.nl/2012/11/git-flow-never-heard-of-it-good-you-don.html)
and not optimized for delivering SaaS software.  Every part of Git Flow
reeks of waterfall development and desktop software release cycles.

I wanted something *similar* to Git Flow, but *simpler*.  I wanted a process
that accurately modeled how we were using continuous integration and continuous
deployment methodologies.

## The Basics

Continuous integration and continuous deployment need to be included from day
one.
{% post_url 2014-05-22-day-one-rails-continuous-integration %}

, I have designed a development workflow that is highly optimized
for working with software development teams building SaaS platforms with
continuous integration and continuous deployment strategies.  I have been
applied this framework across multiple companies and even to opensource projects
with minimal variation.

# Workflow Overview

and [a presentation to help visualize the whole process](https://docs.google.com/presentation/d/1euOiki_e4OQ4jymGhS-o3xcET8-KZhDONUolDlOVT30/edit?usp=sharing):

<iframe src="https://docs.google.com/presentation/d/1euOiki_e4OQ4jymGhS-o3xcET8-KZhDONUolDlOVT30/embed?start=false&loop=false&delayms=60000" frameborder="0" width="480" height="389" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

This workflow is similar to [the Git Flow process](http://nvie.com/posts/a-successful-git-branching-model/)
but has been simplified to the *minimum* amount of process necessary to go from
local development to running code in production.  


## Let's get Hacking!

### Create feature branch
```bash
$ git start my-feature-branch
```

### Test feature branch in QA/staging environment
```bash
$ git integrate staging
```

### Create Github pull request to review changes
```bash
$ git review
```

### Release feature branch
```bash
$ git release
```

## TheGarage-GitX Gem

Optimizing the command line experience for developers (and designers) has been
critical to the success of this workflow.  We built [TheGarage-GitX Ruby gem](https://github.com/thegarage/thegarage-gitx)
to inject custom commands into the Git namespace and streamline the process
as much as possible.  

The beauty of this approach is that there's really **no magic going on here**.
TheGarage-GitX gem is nothing more than a set of helpful git aliases that
run a series of standard git operations with a single command.  You can see the
actual git commands it runs during each step and even avoid using the shortcuts
entirely if you are comfortable with the overall flow.


## CONTRIBUTING.md

Want to help new developers know what is expected of their contributions?  Just
create a CONTRIBUTING.md file in your Github repository and developers will
automatically see the document [any time they create a pull request](https://github.com/blog/1184-contributing-guidelines).
Github makes the lives of developers oh-so-nice.

I've found the CONTRIBUTING.md file to be a great place to document the
entire development workflow and walk developers through the process step by step.  

Here is the [CONTRIBUTING.md template](https://github.com/thegarage/thegarage-template/blob/master/files/CONTRIBUTING.md)
I use by default for all new projects.
