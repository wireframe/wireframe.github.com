---

title: "The Oracle Foolset"
date: 2004-07-12
comments: false
tags:
 - java
 - oracle
---

I've got issues with Oracle's J2EE Toolset (aka: Foolset). I've spent 3 years building infrastructure and applications using the best open source tools and design practices available. The result was a very flexible and scalable system that used EJB session facades to access database resources (cached with EJB entity beans for heavy load areas). Recently, management decided to go with Oracle's attempt at a J2EE solution. Throw out those standards like EJB, Swing and haul in a load of proprietary tools like BC4J, Oracle Forms!


Suposedly, developer productivity was a major reason for choosing the Oracle toolset. Oracle claims that using their toolset will allow for developing J2EE applications 30% faster. 30% FASTER THAN WHAT?!?! In the brief time that was spent reviewing the Oracle suite, I was able to use my existing toolset (Eclipse, XDoclet, Maven) to crank out proof of concept applications, before the other developers could even get off the ground with JDeveloper. Sure, it might be faster to develop with their weak attempt at an IDE compared to hand coding all the EJB interfaces and deployment descriptors, but who in their right mind still hand codes their EJB's? Oracle's claims of being more productive are flat out unjustified.


Next up on my list of gripes was the complete lack of J2EE knowledge held by ANY Oracle person we dealt with. Now, I'm not just talking about sales reps. We went through demonstrations with developers and even brought in an Oracle consultant to try and get their infrastructure up and running. Not only were they incompetent and unable to get working prototypes up and running, they had the audacity to blame the problems on our application design. It appears that in "Oracle's World", Entity beans are the major bottleneck in a J2EE application and should be avoided at all costs. They actually recommended that we removed all of our Entity Beans and used direct connections to the database instead. Excuse me?!? Since when has ANY network call been faster than an in memory cached lookup? I went through some extensive performance and load testing over the past year, and that's WHY we were using Entity beans. I completely lost any respect these guys might have earned from me.


Should I blame Oracle for this frustration, or management for not researching the correct solution? The answer is both! Management was fooled by all of the "smoke and mirror" shows that Oracle put on, and didn't bother to look underneath to hood to see that Oracle was peddling a sham of a replacement for our current architecture. I also place a good deal of blame on Oracle for the blatant tricks they were trying to pull, along with their gross incompetence in the J2EE market. Do I sound bitter at all to you?


NOTE: I have absolutely nothing against making an a decision like this if it is based on educated and rational information. I've seen other companies choose Oracle's J2EE products for reasons like the speed of their appserver and their tight integration with their database and LDAP server, but this decision was anything but logical. I've been accused as only promoting open source software and shunning commercial offerings, but this is definitely not the case. I'm all for using the BEST software available whether it's open source or not. It just so happens that more often than not, open source offers better stuff. =)

