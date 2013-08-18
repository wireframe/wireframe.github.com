---
layout: post
title: "Beyond Spring RCP"
date: 2005-11-11
comments: false
categories:
 - java
 - spring
 - springrcp
---

Good bye Spring RCP. It's been nice knowing you, and maybe I'll run into you again sometime later in life...



Last weekend was the first chance I've had to work on [shard](http://shard.codecrate.com) in quite some time and I thought it might be a good chance to update to [the most recent snapshot of Spring RCP](http://maven.codecrate.com/spring-rcp). After fixing a few compilation errors, the app started up without a problem. Unfortunatly, clicking around the app didn't fire the action excecutors anymore, and so the app was basically dead in the water.



I think it's time for me to find an alternative to Spring RCP. I have a limited amount of time to spend working on [my opensource projects](http://shard.codecrate.com), so the time I do have must be spent wisely. Instead of tinkering or troubleshooting issues in an immature framework, I need something dependable. Spring has been a big help for me, and working with Spring RCP was a good learning experience, but I'm just not productive right now.



I'm a bit disapointed with the current state of Spring RCP. The developers have made it very clear that it is still considered alpha, but a 0.1 release was originally planned over a year ago and there are still no public releases or documentation available. I knew what I was getting into by choosing the "bleeding edge", but I was expecting things to stabalize more quickly than they have. Hell, I used maven a good year before it's beta release, and it was a much less bumpy ride that this. I guess I'm most frustrated with the fact that Spring RCP is so broad in scope, yet no piece seems to really be rock solid. I would much rather prefer to see a 0.1 release that does a few things really well, than waiting years for every single piece of the framework to shake things out.



Eclipse RCP is one of my top candidates right now, but I have [my reservations about using SWT]({% post_url 2004-07-27-no-jsr-for-swt %}). Netbeans also has a RCP framework, but it seems that [developing RCP applications with Netbeans has a higher learning curve than Eclipse plugin development](http://blogs.sun.com/roller/page/dreamwords/20050328).

