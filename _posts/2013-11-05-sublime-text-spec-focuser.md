---
layout: post
title: "Sublime Text Spec Focuser Plugin"
date: 2013-11-05
tags:
  - testing
  - ruby
  - rspec
  - sublimetext
  - opensource
---

Guard has been my tool of choice for continuous testing for quite some time now, and I can not recommend it enough.  One of my only complaints with the workflow is that **Guard can be too aggressive** and run all the specs in the relevant files which creates overwhelming amount of feedback, when I actually just want to focus on a few specific tests.

Rspec supports [tagging specs](http://stackoverflow.com/questions/5069677/how-do-i-run-only-specific-tests-in-rspec) as an elegant way to temporarily restrict your spec runner to only run a specific set of tests.  This works out of the box with the Guard RSpec runner, but it can be cumbersome to constantly add and remove `focus: true` statements for each of your specs...**until now**!

For the past six months, Sublime Text has been my primary IDE, and I've released my first Sublime Text plugin, the [Sublime SpecFocuser plugin](https://github.com/wireframe/sublime-spec-focuser), to help streamline your workflow of focusing on Rspec tests.

The SpecFocuser plugin adds a convenient command that will automatically tag your currently selected spec with the proper `focus: true` statement.  The plugin is also smart enough to traverse up your current scope as well to find the nearest `it`, `context` or `describe` block.  And the best part is that once you've wrapped up your testing, re-running the plugin command will strip out the `focus: true` statement and get you back to a clean, un-focused test suite!

This is my first foray into the world of Sublime Text plugin development, and although I'm not a huge fan of Python, I'm impressed with the flexibility of the Sublime Text plugin system.  That's quite a statement given that after two solid years of working with VIM, I still cringe at the idea of delving into Vimscript!

I see a lot more hacking on Sublime Text plugins in my future to further optimize my development workflow...
