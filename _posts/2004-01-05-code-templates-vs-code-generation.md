---
layout: post
title: "Code Templates vs. Code Generation"
date: 2004-01-05
comments: false
tags:
 - java
---

How does code templating compare to code generation? What are the benifits/drawbacks, and what should you use? Code templating is a common feature of IDE's like netbeans and eclipse. Basically, it's a wizard to write code for you. Code templates range in simplicity from if/else code blocks to basic Java beans and GUI design, to complex J2EE objects like EJB's. Oracle's JDeveloper has a template that will generate EJB interfaces (home/remote), deployment descriptor, and the implementation class. Code generation is done by a variety of tools like [XDoclet](http://xdoclet.sf.net). Using a design pattern very similar to MVC, the source code is only the model for of the overall application. The code generating tool will take the source code at compile time and generate files/code from some form of metadata. Code generation at runtime would be an amazing feat, and maybe AOP will address this somehow?


The difference between templating and generation comes AFTER the files or code have been created or modified. In my opinion, this is where the hidden cost of code templating comes into play. Using code templating, after the code is generated, the code is now owned by the developer and it is up to them to further modify or touch up the code (ex: coding style or standards).


Code templating and generation both have one possible drawback. At the expense of making coding faster and more efficient, there is a decreased understanding of the code's "plumming". Nothing frustrates me more than hearing, "I don't know what happened, the IDE/build tool did it for me.". Here's a new's flash for you, these tools are to HELP you, not BABYSIT you. If you can't code without them, don't code!

