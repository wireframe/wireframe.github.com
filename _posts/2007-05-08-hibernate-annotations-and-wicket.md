---
layout: post
title: "Hibernate Annotations and Wicket"
date: 2007-05-08
comments: false
categories:
 - java
 - hibernate
 - wicket
 - database
---

Wow. It's been an insane 24 hours.

   
   
It all started by me posting this simple question on the wicket mailing list:
   
   
Anyone have some fancy integration of hibernate and wicket?
   
   
   
The response?
   
   
Why don't you write one?
   
   
   
And so it began...
   
   
After a flurry of research into this area, I've whipped together a hibernate/wicket object that reads [hibernate annotations](http://www.hibernate.org/hib_docs/annotations/reference/en/html_single/) and configures the wicket component respectively.

   
   
Essentially, right now it will auto configure a component by:
   
   
  - set component to be "required" when using NotNullannotation

   
  - add "maxlength" attribute when using Lengthannotation

   
   
   
Still lots of work to be done:
   
   
  - attach client side javascript validation

   
  - maybe integrate into the wicket validation framework?

   
   
   
The code is checked into wicket stuff and I'd appreciate anyone interested to take a look and let me know what they think.
   
   
[http://wicket-stuff.svn.sourceforge.net/viewvc/wicket-stuff/trunk/wicketstuff-hibernate-behavior/](http://wicket-stuff.svn.sourceforge.net/viewvc/wicket-stuff/trunk/wicketstuff-hibernate-behavior/)
   
   
