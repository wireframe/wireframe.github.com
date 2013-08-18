---
layout: post
title: "Wicket Drag/Drop Components"
date: 2005-09-21
comments: false
categories:
 - javascript
 - java
 - scriptaculous
 - wicket
 - ajax
---

After finishing up work on the [autocomplete text field]({% post_url 2005-09-06-choice-is-good %}), I've spent the last few weeks trying to figure out what AJAX component to implement in Wicket next. [Scriptaculous]() has some great demos of drag/drop and it definately has some cool use cases, so I think I'll delve into this area next.



I've already figured out how to drag images around using scriptaculous, but I have a feeling that handling the drop may be fairly difficult. My [first stab at creating a DraggableImage](http://cvs.sourceforge.net/viewcvs.py/wicket-stuff/wicket-contrib-scriptaculous/src/java/wicket/contrib/scriptaculous/dragdrop/) is fairly simplistic, but it works for now. Once I figure out how to drop images onto an area, I'll come back to improve the DraggableImage. I've checked in this basic DraggableImage and [a new example has been added to wicket-stuff](http://cvs.sourceforge.net/viewcvs.py/wicket-stuff/wicket-contrib-scriptaculous-examples/src/java/wicket/contrib/scriptaculous/examples/dragdrop) to demonstrate its current functionality.

