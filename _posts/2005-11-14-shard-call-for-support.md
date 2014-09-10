---

title: "Shard: A Call For Support"
date: 2005-11-14
comments: false
tags:
 - java
 - shard
---

I recently received some very critical, yet crucial, feedback on my managing of [the shard project](http://shard.codecrate.com). I'd like to take the time to try and respond to that criticism, and it's probably a good thing for me to justify my decisions.



Maven doesn't float everyone's boat. I admit that it's usually a Love or Hate relationship, but at the end of the day, its is just another build tool. If ant could be used to build a project like shard with as much ease as maven, I'm all for it. That being said, I have yet to see anything provide the ease of building and publishing multiple artifacts the way maven does. Want to use Ant instead of Maven? Patches are welcome...



The infrequent releases are a direct response to the limited amount of support for the project, and my limited amount of time to devote to the project. I have come to the very important realization that you can not build out a framework without knowing what clients need from the API, and I have yet to hear from users what they need from a d20 API. With the exception of the Shard Toolset (character generator and dataset manager), there are no known consumers of the shard API requiring me to perform releases. I'm a firm believer in "release early, release often", but right now I "release early and often" for my own use.



It may seem like my focus for shard has shifted over time (hibernate, spring-rcp, lucene, etc), but it has always been focused on what I have needed. My gaming group recently took the time to go through all of our d20 books and log all of the skills/feats. Over 400 feats were saved in excel, and I found it extremely important to be able to import the bulk datasets into shard without manually re-entering all of that data. My original focus was on the core character API, but for the time being it has been pushed to dataset management.



If there's anything of value in the shard project, it's the goal of creating a common set of d20 building blocks. I want to highly encourage anyone considering rolling their own d20 tools to try to leverage what's currently available in shard. If there are pieces lacking for what you are trying to build (which I am sure there are), let's work together to build that functionality into shard. This way, future d20 applications and tools can be built quickly and easily to benefit the whole gaming community.

