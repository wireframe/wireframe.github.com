---
layout: post
title: "Rails Development: Day One Continuous Integration"
tags:
 - testing
 - ruby
 - rails
---

One of the most important things every new project should complete on their first
day is to define their continuous integration process.  [Continuous integration](http://martinfowler.com/articles/continuousIntegration.html)
has become such an essential part of modern day software development that having
a continuous integration strategy on **Day One** establishes the automation
infrastructure necessary to scale as your project and team grow.

Many Rails applications consider running `rake spec` the definition of
a continuous integration process and although it's a good start, continuous
integration is about more than unit/integration tests.

The ultimate goal of a continuous integration test suite is to **ensure the
project is in a good state before being released to customers**.  The actual
definition of *“good state”* is project and team specific, but at a
high level, your continuous integration process should be **automating
as many checks and balances necessary to feel confident that you are releasing
good code**.

<p class="text-center">
![Automate All the Things]({{ site.url }}/images/automate_all_the_things.jpg)
</p>

Here are the basic structure I've developed over the years for each project to
kickoff their continuous integration process on the right foot...

## The Basics (Test suite)

First off, your continuous integration process **needs** to make sure your
test suite passes.  Pick your framework ([RSpec](http://rspec.info/),
[Jasmine](http://jasmine.github.io/), etc), and use tools they provide.
Nothing fancy is necessary. If the tests aren't green, go back to square one.

If the tests pass, that’s great **but**...a project with zero tests *technically*
qualifies as a successful build, so adding a test coverage check is
**extremely** useful to ensure your code has an **adequate level of testing**
in place.  Test coverage is apparently [a controversial topic now](http://www.confreaks.com/videos/3315-railsconf-keynote-writing-software),
and even though I agree it is not perfect, test coverage is extremely easy to
automate and has been highly effective within my projects at catching untested
code paths.

[Simplecov](https://github.com/colszowka/simplecov) is my preferred library
for monitoring code coverage, and I recommend using **95%+ coverage as a good starting
point**.

## Best Practices (Styleguide)

Every developer has their own coding style, and [every project should have a set
of accepted principles for collaborating in a single codebase and building maintainable code](http://www.smashingmagazine.com/2012/10/25/why-coding-style-matters/).
Most [development](https://github.com/bbatsov/ruby-style-guide)
[communities](https://github.com/airbnb/javascript) have have codified their
best practices which provide an excellent baseline.

Establishing a coding style guide for your team on Day One saves you a
**significant** amount of time rather than trying to retro fit a set of best
practices later on in the project development lifecycle.  As your team grows,
having a style guide in place makes it that much easier to onboard a new developer
and ensure that new code is written inline with existing conventions.  Sure, you
**could** just encourage best practices via a static style guide document, but
who would read it?  Who would maintain it?  Who would **enforce it**?

Javascript, Ruby, CSS linting libraries are readily available ([Rubocop](https://github.com/bbatsov/rubocop),
[JSHint](http://jshint.com/), etc) to automate this menial task and enforce your
codebase is adhering to the best practices defined by your team.  My recommendation
is to **start Day One with the basic out-of-the-box best practices, and tweak your
ruleset overtime as exceptions arise**.  It get's you up and running quickly and
sets the foundation for incremental changes as the need arises.

Another benefit of automating this task is that it removes the burden from
developers during a code review process to feel the need to be "human syntax checkers"
and focus on the bigger picture issues (architecture, modeling, API design, etc).

## Sanity Checks

[Brakeman](http://brakemanscanner.org/) and [BundlerAudit](https://github.com/rubysec/bundler-audit)
are two great tools to plug into your continuous integration process as an
extra level of defense to ensure known vulnerabilities do not get released to
production.  They both run quickly and are worthwhile investments into include
in your automated CI builds.  

The goal is not to perform a full penetration test
or security audit of the system.  It is to give you **an increased confidence**
that you are shipping "good code".

## [optional] Project Reports/Metrics

Some teams benefit from having a standard set of reports generated
with every continuous integration run.  These reports **should not** fail
the build and their objective is simply to **get relevant information
in front of developers to motivate future changes**.  

Some examples of reports that might be useful for your team include:

* `rake stats` - high level overview of project codebase stats
* `rake notes` - view all `TODO`, `FIXME`, etc tags in the codebase
* `bundle outdated` - view list of outdated gems that may need to be upgraded

It's been very interesting to see how simply surfacing this information every
time the build is run has led to developers actually *caring* about those `FIXME`
tags littered around the codebase and doing something about them.

These reports need to be **fast** to be included in the continuous integration
process.  If they take too long, it will only lead to developer frustration.  If they are
useful try **very** hard to have them run with every build.  Having them run
only occasionally makes it extremely unlikely that someone will see them and act
accordingly.

The bottom line is:
> If you find that a report has value then use it, otherwise, move along...

## Rake Integration

So, how do you wire this whole thing up?  Here’s my boilerplate Rake task that
I use for each of my projects.  Just drop this into `lib/tasks/ci.rake` and
update your `Gemfile` to include the necessary dependencies and you’re good to
go!  This little template has provided a **huge** amount of value for new projects on
Day One, and is easily customizable for future needs.

```ruby
# lib/tasks/ci.rake
# continuous integration build task
task :ci do
  # define all of the dependent tasks for a "clean build”
  # add/remove tasks from this list as you see fit for your project
  tasks = []
  tasks << :spec
  tasks << :rubocop
  tasks << 'spec:javascript'
  tasks << :jshint
  tasks << 'brakeman:run'
  tasks << 'bundler:audit'
  tasks << 'stats'
  tasks << 'notes'

  # execute tasks
  tasks.each do |task|
    Rake::Task[task].invoke
  end
end
```

Run the continuous integration process:

```bash
# Run the full continuous integration build
$ rake ci
```

I also recommend aliasing the `ci` Rake task to the Rake default task so you can
run Rake from the command line without any arguments.  It helps
new developers get up and running quickly without having to hunt around and is
also useful when working with tools like [Travis CI that run the default Rake
command without extra configuration](http://docs.travis-ci.com/user/languages/ruby/#Default-Test-Script).

```ruby
# Rakefile
require File.expand_path('../config/application', __FILE__)

MyApp::Application.load_tasks

task default: :ci
```

You can **absolutely** use a shell script instead of Rake for your build script
(ex: bin/build) and the core principles of the process remain the same.  I
personally find Rake a bit nicer since it simplifies exit code management and
is written in Ruby.

## Go!

With this basic framework in place, you can **start shipping good code with
confidence** on Day One of your next Rails application!  

If you have an interesting continuous integration process that works for you, 
I'd love to hear about it!
