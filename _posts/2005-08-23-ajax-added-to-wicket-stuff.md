---
layout: post
title: "AJAX Added to Wicket-Stuff"
date: 2005-08-23
comments: false
tags:
 - javascript
 - java
 - scriptaculous
 - wicket
 - ajax
---

There was quite a flurry of activity after my [blog post yesterday]({% post_url 2005-08-23-wicket-autocomplete-text-field %}).

It seems that this is not the first attempt to build auto completion components using the new Wicket AJAX support. In order to foster some collaboration and build a true "community component", the AutocompleteTextField has been accepted into the [wicket-stuff project](http://wicket-stuff.sf.net). This will be an incubator of sorts to smooth out any rough edges for the AutocompleteTextField API before it's hopefull graduation and inclusion into the core Wicket AJAX components. This should allow for Wicket experts some time to [tear into the code](http://cvs.sourceforge.net/viewcvs.py/wicket-stuff/wicket-contrib-prototype/) and give direction for a more elegant solution.



In order to provide some usable examples for people, wicket-stuff has also added [a new subproject](http://cvs.sourceforge.net/viewcvs.py/wicket-stuff/wicket-contrib-prototype-examples/) that can be used to test out and excersise the AutocompleteTextField. I'll be writing up more complex examples soon that show how to really take advantage of the [Prototype](http://prototype.conio.net/) auto complete functionality. The [scriptaculous demos](http://script.aculo.us/demos/ajax/autocompleter_customized) should give you an idea of the improvements I'll be adding.



For anyone interested in giving this autocomplete component a test drive, I just published a [snapshot version of the component on my maven repository](http://maven.codecrate.com/wicket-stuff/jars/). The Prototype javascript files are already packaged with the jar, so it should be as simple as dropping the jar into your app and letting it rip! I have only tested the component with wicket-1.1-b2, but I will probably try out wicket-1.1-b3 sometime next week.



If there are changes or improvements that you would like to see, please drop me a line or send an email to the wicket mailing list.

