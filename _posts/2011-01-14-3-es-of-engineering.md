---
layout: post
title: "The 3 E's of Engineering"
date: 2011-01-14
comments: false
tags:
 - process
 - development
---




Anyone that calls themself an engineer knows "the look". The one that strangers give when you first tell them that you're a Software Engineer. The blank stare, the glazed eyes and the usual lame response about how smart, lucky or rich you must be.


I've had the great privilege over the years to train new developers and mentor developers of the future, and the most important event of someone's first day is for me to burst that great big pink bubble and bring them back to reality.


Software development is hard. It's equal parts art and science, and being a real engineer is anything but easy.  Engineer has three e's and every single engineer needs to master The 3 E's of Engineering.


Estimate
--------

A good software engineer needs to estimate tasks accurately. It takes a lot of practice and gets easier the more experience and domain knowledge you have with a given product or area of expertise.


Estimation is about giving a level of effort "guesstimate" for how difficult a task will be. An estimate should be stated in difficulty, not duration. Estimating using hours is an extremely common and [disastrous](http://scrum.jeffsutherland.com/2010/04/story-points-why-are-they-better-than.html)[mistake](http://www.agilegamedevelopment.com/2006/03/hours-vs-story-points.html) and all estimates should be given in points or a it is as simple as stating a low, medium, or high level of effort for a given task.


An estimate is almost always resource agnostic meaning that if a task that is estimated as "difficult", it will be difficult regardless of who actually does the work. For example, an experienced developer may be able to complete a difficult task quicker than a less experienced developer, but this is explained by each developer having a different personal velocity and does not change the fact that the task was labeled as "difficult".


An estimate is an agreement for how difficult a task will be, but it is not a contract. It is not intended to answer, "How long will this take?" or "When will this be done?". The estimate is only one part of the equation necessary for building an effective product roadmap and you need to understand all the other variables before you can see the whole picture (prioritization and resource allocation are the other critical components, but that topic is for another blog post!). :)


Evaluate
--------

A good software engineer needs to evaluate risk and more importantly to minimize unnecessary risk whenever possible. This is another area where practice and experience are the best ways to improve, but there are a few rules of thumb that should help every developer.


Be fluid, react quickly, and over-communicate changes or risks as they occur. If waterfall software development has taught me anything (other than how horribly broken it is), it is that you can never plan every aspect of a project before starting implementation. Even the best planned and estimated project will still encounter bumps along the way and need adjust accordingly. Over-communicating possible risks to the rest of your team and business is the perfect place for [Socialcast](http://www.socialcast.com/). Avoid excessive meetings and endless email threads when raising a red flag.


Use [feature flags](http://code.flickr.com/blog/2009/12/02/flipping-out/) to roll out new features and test changes incrementally. Support turning on (and off) features at a granular level for an individual user or subset of users before going live for everyone.


Without monitoring, success is just a guess. How do you know that releasing a feature actually improved your product? How do you rollback a change if it negatively impacts your user experience?


Beware the word "re-write" and never ever listen to someone that says you need to "re-write and start over". It's a [death sentence](http://www.joelonsoftware.com/articles/fog0000000069.html).


If something doesn't feel right, it probably isn't. Put the breaks on when changes make the task no longer relevant. Failing fast is actually a huge success! Don't linger on the time you've invested on something that get's thrown away. Dwell on the time saved not finishing the irrelevant project.


Execute
-------

A good software engineer needs to execute and complete tasks quickly and efficiently. Excellence in this area boils down to following a few very simple rules.


Build the absolute simplest thing that could possibly work. No more. No less


It's not done until it's tested and if it's not tested, it's already broken (you just don't know it yet).


Don't check it off as complete until it's in production. Minimize risk to get that shit done and out the door!
