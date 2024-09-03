---
title: "Git eXcited"
tags:
- ruby
- git
- opensource
---

As a developer, **optimizing your version control workflow is one of most valuable
productivity improvements you can make**.  It is one of the most
frequently used pieces of software used during your work day (second only to
your IDE), and incremental gains have huge long term pay off.

I have developed custom git extensions and workflows for a **long** time, and
it is amazing to see how much [the gitx project](https://github.com/wireframe/gitx)
has evolved with literally **years** of refinements.  At it's heart, the gitx
project offers a set of utility git scripts (packaged within the git namespace)
to simplify and optimize common workflows such as:

* starting a new feature branch with latest version of master updating a
* feature branch with the latest code that has been released to master
* integrating a feature branch into a staging environment releasing a feature
* branch to master

Having these workflows packaged into single commands is a huge help for your
entire team to just "do the right thing" with no guesswork or opportunities for
error (ex: "I forgot to pull latest master before I started my feature branch
and now the merge conflicts are killing me!"😎)

The gitx project is optimized for continuous delivery workflows used within
many development teams, *but* it is flexible enough to support alternative
workflows as well (ex: iOS/Android projects, rubygems, etc).  It also offers
tight integration with Github including auto creating pull request and
autolinking issues from commits.

And here's a simple scenario to help get an idea of what the workflow may look
like:

```bash
$ git start fix-all-the-things
$ # fix all the things and commit them to git as normal
$ git integrate staging && echo "Integrate into staging environment for QA"
$ git release && echo "Merge changes into master!"
```

*Git moving and build something awesome!*
