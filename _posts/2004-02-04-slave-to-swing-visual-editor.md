---

title: "Slave to the Swing Visual Editor?"
date: 2004-02-04
comments: false
tags:
 - java
---

Swing is a difficult platform with a high learning curve. It is also extremely flexible and powerful, but scares away it's fare share of developers with it's immense API. On top the core API, getting a handle on the Swing layout managers can be a nightmare for beginners. Thus, the market was opened for helpful editor's to visually layout a Swing application for you (note the sarcasm). Many IDE's (Netbeans, JDeveloper, JBuilder) played up the visual editor as the best thing since static methods. In a perfect world, these editors would allow you to layout your application and code buisness logic in perfect harmony allowing for such an increase in productivity that I could actually take a vacation here and there. Unfortunately, this is not so and never will be.



Why? Because visual editors have taken the approach of littering my well structured business logic with it's garbage resembling Java code. Most visual designers due such a pathetic job of this code generation, that it makes me sick. Once the code has been generated, Woe to the developer that tries to modify it! I have yet to see a visual designer that can handle staying in synch between manual and visual editing. Each editor forces this mixing of concerns by putting code for the Model, View, and Controller into the same class. This generates extremely large Java files and forces vendor lockin. The visual editor SHOULD just be handling the view, and I should be free as a developer to change from designer to designer with ONLY having to rewrite the layout. Not so when you have a two thousand line Java file with intermingled generated code and buisness logic. Since these visual editors use code templates to generate your application, and each editor uses different templates, you again restrict yourself to one IDE and can not change to another.



The solution to this whole problem has been right in front of us the whole time. Swing is an amazing framework built upon the concept of MVC (Model View Controller). Now, why does it take a rocket scientist to realize that the use of these visual designers breaks the most fundamental concept of Swing? This mixing of concerns is not only ugly, but it is also completely unnecessary! [UIC](http://uic.sf.net) is a project that promotes an excellent level of seperation of concerns and helps generate very maintainable applications. Layout your application using [QtDesigner](http://www.trolltech.com), and use UIC to generate a base Swing class. From there, you can extend the generated class to perform all of your buisness logic and dynamic coding. Sounds like MVC as it was meant to be! Also, the Eclipse project has a solution on the horizon that may quiet many of my fears. The [Eclipse Visual Editor Project](http://www.eclipse.org/vep) appears to have an amazing product on their hands, and I will have to wait and see how it actually performs.

