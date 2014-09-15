---
title: "Optimized Development Workflow"
tags:
 - opensource
 - development
---

Over the years, I have worked to define and refine a software
development process that worked for me and my teams.  It needed to be simple,
flexible and agile yet uncompromising in a set of fundamental principles.

I started off using [the Git Flow process](http://nvie.com/posts/a-successful-git-branching-model/)
but it didn't take long to realize that the Git Flow process was not meant for
our team.  It was [simply too complex](http://www.frenck.nl/2012/11/git-flow-never-heard-of-it-good-you-don.html)
and not optimized for delivering SaaS software.  Every part of Git Flow
reeks of waterfall development and desktop software release cycles.

I wanted something *similar* to Git Flow, but *simpler*.  I wanted a process
that accurately modeled how we were using continuous integration and continuous
deployment methodologies.

## The Basic Building Blocks

#### Master branch == Production environment

Straightforward and simple.  Continuous integration and continuous deployment
take care of building all code checked into master, validating all tests pass,
and automatically deploying to production.  Continuous integration also will
create a unique tag in git for each release.

#### All development is done on feature branches

No shockers here.  This has been a best practice in software development for
a long time and git makes this stunningly easy.

#### Staging branch == Staging environment

How do you test your feature branch in a non-production environment?  This is
where things get interesting.  The staging branch is what I call an
**aggregate branch**.  It represents a clone of the master branch with one or
more feature branches merged into it.

The staging branch can potentially have multiple feature branches in QA state
at the same time, but each feature can be released independently by merging
the associated feature branch into master.

I know what you're thinking...this won't scale to large teams, but I've personally
used this flow with a team of 25 developers and not had any issues other than
the occasional merge conflict.  Not coincidentally, this workflow encourages
developers to be aware of potential merge conflict "hot spots" and leads to
better designed code as a result (ex: using small config/initializers instead
of lumping all configuration into application.rb)

And if the staging branch gets into a bad state, no worries.  We have a simple
way to `nuke` any aggregate branch back to a known good state using git tags
that are created via continuous integration.

#### Peer Review with Pull Requests

Github pull requests are incredible to facilitate discussion for feature branches.
It is a transparent way for team members to review each others code and a convenient
way for stakeholders to see what's going on in a project.


#### Continuous Integration and Continuous Deployment

[Continuous integration and continuous deployment need to be included from day
one]({% post_url 2014-05-22-day-one-rails-continuous-integration %}).  These systems are the orchestration layer that perform all the heavy
lifting of validating and deploying each set of changes.


## Example Workflow

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

And here is [a presentation to help visualize the whole process](https://docs.google.com/presentation/d/1euOiki_e4OQ4jymGhS-o3xcET8-KZhDONUolDlOVT30/edit?usp=sharing).

<iframe src="https://docs.google.com/presentation/d/1euOiki_e4OQ4jymGhS-o3xcET8-KZhDONUolDlOVT30/embed?start=false&loop=false&delayms=60000" frameborder="0" width="480" height="389" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>


## TheGarage-GitX Gem

Optimizing the command line experience for developers (and designers) has been
critical to the success of this workflow.  We built [TheGarage-GitX Ruby gem](https://github.com/thegarage/thegarage-gitx)
to inject custom commands into the Git namespace and streamline the process
as much as possible.

The beauty of this approach is that there is absolutely **no magic**.
TheGarage-GitX gem is nothing more than a set of helpful git aliases that
run a series of standard git operations with a single command.  You can see the
actual git commands it runs during each step and even avoid using the shortcuts
entirely if you are comfortable with the overall flow.

## CONTRIBUTING.md

Want to help new developers get up to speed on your development workflow? Just
create a CONTRIBUTING.md file in your Github repository and developers will
automatically see the document [any time they create a pull request](https://github.com/blog/1184-contributing-guidelines).
Github makes the lives of developers oh-so-nice.

I've found the CONTRIBUTING.md file to be a great place to document the
entire development workflow and walk developers through the process step by step.

Here is the [CONTRIBUTING.md template](https://github.com/thegarage/thegarage-template/blob/master/files/CONTRIBUTING.md)
I use by default for all new projects.

This workflow was designed and optimized for teams building
SaaS products but I have even applied this framework to opensource project
development with minimal variation.
