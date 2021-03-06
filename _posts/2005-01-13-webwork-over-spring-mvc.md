---

title: "Webwork over Spring MVC"
date: 2005-01-13
comments: false
tags:
 - java
 - spring
---

I've been exposed to [spring](http://springframework.org) recently and have been impressed with it's flexibility and power. Today, I took a look at spring MVC, and I must say that I'm not very impressed. I've worked with Webwork2 over the past year and find it to be a much better solution. Granted, this was just a first impression, but from what I've seen, the Spring MVC makes you jump through a lot more hoops, while Webwork "Just Works".


My first gripe with Spring MVC is the proliferation of presentation "Bean" classes. With Webwork, I can reuse my business objects in my actions and have them populated directly from the input. Tack on Nanocontainer, and information can be populated from the Application, Session or Request scope.


Webwork automatically populates your view context by what you expose on your Action class, which is much more convenient that Spring's convention of manually placing your informaiton into a hashmap. This makes Webwork extremely easy to get up and going.


I also really like how Webwork enforces the idea of one Action equals one Page. With Spring, a single controller can service multiple different operations, and although it's "flexible", it also leads to a proliferation and hard to follow workflow. With webwork, I know exactly that Welcome.action maps to WelcomeAction.java. This is simply not the case with spring. This is even more of a problem with their so called "Wizard Controller Framework". One controller will service many parts of a wizard, yet it just makes so much more sense for them all to be separate actions. I have seen code for wizard controllers become mangled and messy trying to handle all the interrelated actions. They become bloated and extremely hard to maintain.


I was also quite disappointed to see that controllers hard code the result/view of their action. I think Webwork has a huge advantage where one action can be mapped to any number of results depending on the actions output (success, error, input, etc). Webworks architecture allows for building a web application in more of a component based approach, but I'll blog more on this later...


I like spring and think that it shows tremendous potential, but the web MVC framework is far behind what I already have with Webwork. That being said, I think that Webwork (more specifically XWork), should swap out its internals and adopt a better IoC container like PicoContainer or Spring. I found some [great info](http://blog.sunmast.com/alex/archive/2004/12/13/1047.aspx) on comparing these two frameworks, but I would be interested in hearing anyone else's comments or insight.

