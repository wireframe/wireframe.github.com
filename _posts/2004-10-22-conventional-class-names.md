---

title: "Conventional Class Names"
date: 2004-10-22
comments: false
tags:
 - java
---

What are the most common conventions for naming Java classes? I've been subject to several different conventions would like to hear if there are any good guidelines out there. Here are some of the conventions I've come across and I would like to know if there is a good general pattern to follow.


Example Interface Naming Conventions


  - Prefix classname with "I". ex: IClassName



Example Implementation Naming Conventions


  - Add Impl suffix. ex: ClassNameImpl


  - Put implementation in seperate package. ex: org.myapp.impl


  - DefaultMyClass



Example Abstract Class Naming Conventions


  - MyClassUtil or MyClassUtils


  - AbstractMyClass


  - MyClassSupport



I've read some interesting articles on this topic and think that the best strategy is that a classname should not to not allow a caller to know if a class is an interface or concrete class. This allows for possible later refactoring without breaking the clients.


An example of this would be to start with concrete simple class called MyClass. Once multiple implementations are available, MyClass becomes an interface and the old implementation becomes DefaultMyClass. The caller "may" need to reference DefaultMyClass, but otherwise their code will remain the same.

