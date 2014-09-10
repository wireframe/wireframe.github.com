---

title: "API Exploration"
date: 2008-05-12
comments: false
tags:
 - ruby
 - java
 - testing
---

For the past several years, my standard workflow for investigating new Java tools and technologies relied on writing a series of "bare bones" unit tests to explore functionality. These unit tests were absolutely vital for me to get up to speed quickly on new libraries like spring, lucene and hibernate.



The use of unit tests as a "launcher" has largely grown out of the difficulty of bootstrapping a simple Java application. Java is simply not built to be launched in the same way scripting languages like ruby and perl are. I suppose .NET has the same "limitation".



Now that I'm in the wonderful world of Ruby, things are quite a bit different. The IRB console is a great and effective way to test out an API. Yesterday was a perfect example of this. I wanted to test out one of the [google data api's and they had an excellent walkthrough](http://docs.google.com/Doc?docid=acjpjppxjpcw_6ggg4t7g5&hl=en) based entirely in the IRB shell. It worked great, and I was very impressed with the overall experience. How would this tutorial have looked in Java? Not nearly as pretty...



Sure, Java has alternatives that are similar to the IRB console (beanshell, groovy, etc), but nothing comes pre-packaged and ready to go out of the box. This is a major hurdle when you want people to pickup and play with your API. It's just not practical to spend twenty minutes setting up your environment just to play around with a new technology. The IRB shell is definitely a huge selling point of Ruby in my opinion.



One disadvantage to using the IRB shell is that knowledge is lost once the shell is terminated. The "throw away" unit tests written in Java can actually be checked into your codebase which may be useful for getting new developers up to speed with a new API. I've found myself coming back to pieces of code after several months wondering why I did things a certain way, and it's pretty valuable to have the unit tests there for a quick refresher.



Both approaches have their pros and cons. Anyone else have an effective way to prototype API's?


