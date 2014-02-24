---
layout: post
title: "The End of Adobe AIR"
date: 2009-08-03
comments: false
tags:
 - airfail
 - air
---




I have a dream where our developer children will hear the name "Adobe" and not cringe. I can see a day where we won't need proprietary and hacky plugins to solve our most basic web application (and rich desktop) needs. HTML5 is the light on the horizon and Google is her knight in shining armor.


I've built my fair share of cross platform desktop applications in Java, and over the past several months, I've built a fairly successful AIR app. I have no doubt that it was the right decision at the time the project started, but I wouldn't make the same choice again. The Adobe AIR platform's days are numbered, and here's why...


AIR claims to be the perfect solution for both Flash/Flex developers and HTML/CSS developers. Unfortunately, that's a load of crap and any web developer that has tested the waters with the AIR platform knows that it's only good for one thing, Twitter clients. AIR is 100% geared towards Flash/Flex developers and the HTML/CSS/Javascript API's are a bolt-on hacked into the SDK. The amount of information available for developing HTML/CSS/Javascript applications using AIR is laughable at best. Nearly every article of documentation/forums/blogs refer to the Flex API's and it's an exercise for the reader to reverse engineer the Javascript API (if even possible).


My very "scientific" research shows that nearly 15 ka-jillion webpages that have been built over the past 10 years. To say the least, web technologies have proven insanely successful and the number of developers that are familiar with HTML/CSS/Javascript technologies is ridiculous. By comparison, there are roughly 5 million Java developers, 3 million .NET developers and 2 million Flash developers. Adobe is targeted at Flash/Flex developers, Sun is pushing Java FX and Microsoft is promoting Silverlight as the rich desktop solution. That leaves a huge open market of web developers with the skillset needed to apps with HTML/CSS/Javascript technologies. [Titanium](http://titaniumapp.com/) is emerging as the current market leader, and Google will be entering into this market very soon with the [Google Chrome OS](http://googleblog.blogspot.com/2009/07/introducing-google-chrome-os.html).


The web browser has already proven to be the best cross-platform runtime environment and Webkit has become the de-facto standard for embedded browsers. You'd think that using Webkit with AIR would be a good thing. Unfortunately, the version of Webkit packaged with AIR is stripped down and makes even simple things like customizing the scrollbars impossible. Adobe had an opportunity to really push browser rendering forward by embracing HTML Canvas, but instead they've done a wonderful job at crippling the browser environment in such a way to force developers to use Flex/Flash to build visually compelling applications.


The Adobe AIR security model has literally put me at my wits end. From sandboxing to certificate signing, I can't count the number of number of grey hairs on my head due to the ridiculous restrictions of the AIR SDK. My question is why put such extreme handcuffs on the developer? If something is technically feasible, why put in *extra* development work to restrict the SDK API's? A sandboxed environment makes sense on the web, but not for distributed desktop applications. The majority of popular AIR applications use self signed certificates, but this is taboo according to Adobe in an effort to push purchasing potentially expensive code-signing certificates. Signed applications are important, but whenever I install any application, I need to trust the developer regardless of the signed certificate.


Hell, all I want from a desktop SDK is the ease of auto-updating clients as if I was deploying a website. [AIR can't seem to get that right either](http://forums.adobe.com/thread/462791)...


HTML5 has the very real opportunity to give web developers the API's needed to build great rich desktop applications without proprietary components. Audio/Video and filesystem API's will give web developers a real chance to build kick ass stuff. Browser extensions like Greasemonkey and Google Gears have proven the technology stack is viable, and we've seen the iPhone and Palm Pre's SDK's successfully leverage these technologies. Now, we need to push this stack onto every desktop. Waiting for HTML5 capable browser marketshare to reach end users is not realistic, but providing bundled desktop apps with HTML5 embedded browsers seems like a very real solution in today's market.
