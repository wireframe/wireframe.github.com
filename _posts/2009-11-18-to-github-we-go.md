---
layout: post
title: "To Github We Go!"
date: 2009-11-18
comments: false
tags:
 - scm
---

Over the years, I've used a number of source repositories for my published projects.  For a time, I hosted a public personal SVN repo, but the server upkeep was a major turnoff.  Then, there was an extended period where my projects lived within the shell of a parent opensource project (wicketstuff) which was great until the repo structure became unwieldy.


I was recently contacted by someone looking for one of my old Wicket contributions and found out that nearly all of my wicket stuff projects had been relocated in the SVN repo which broke my direct links.  It's perfectly acceptable for the wicketstuff folks to re-arrange their repo as they see fit, but I no longer feel that the wicketstuff repo is the right place for my contributions.  I am not vested in the wicketstuff project and would much rather have my personal projects all located in one central spot so it's easy for me to publish new samples or integrations and not have to worry about finding the "right" repository structure.  In my opinion, shared repo's are simply too much politics and too little hacking.


Github is by far the best solution for these projects and so I have migrated my published projects from the Wicketstuff SVN repo to github.  You can now find my contributed Wicketstuff projects here:

  - [wicketstuff-hibernate-behavior](http://github.com/wireframe/wicketstuff-hibernate-behavior/)- Wicket integration to auto-configure your forms using Hibernate annotations.
  - [wicketstuff-rome](http://github.com/wireframe/wicketstuff-rome)- Wicket component for integrating with the ROME RSS/Atom library
  - [wicketstuff-scriptaculous](http://github.com/wireframe/wicketstuff-scriptaculous)- Web 2.0 Wicket components using the Scriptaculous Javascript library


Unfortunately, the import from SVN to github has totally nuked the commit history for these projects.  The commit history may have been lost due to the project rearrangement done by the wicketstuff devs (SVN fail).  That's really unfortunate, but since the majority of these projects are from one-night coding sessions, there's not a lot of true "history" in them.  It just sucks that to lose the author information.  If anyone has some fix for this, please let me know.  The projects are currently in read-only state, so I would have no issue re-importing them from the subversion repository if that would fix things.
