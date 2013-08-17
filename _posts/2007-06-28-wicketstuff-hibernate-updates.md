---
layout: post
title: "Wicketstuff-Hibernate Updates"
date: 2007-06-28
comments: false
categories:
 - java
 - hibernate
 - wicket
---

It's been a week since [the first "release" of my wicket/hibernate integration, and the [feedback from the wicket community](http://www.nabble.com/HibernateAnnotationComponentConfigurator-t3969383.html#a11266736) has been pretty amazing.



Short iterations are the key to software success, so I've incorporated a number of changes suggested by folks and [pushed out a new snapshot release](http://www.wicketstuff.org/maven/repository/org/wicketstuff/wicketstuff-hibernate/). Changes include:




  - Support OGNL PropertyModel expressions for resolving annotations on models using nested properties. This feature was suggested by Matej, and now allows for the hibernate configurator to inspect _any_PropertyModelthat's supported by Wicket. ex:

```java
new PropertyModel(new MyObject(), "innerObject.name");
```



  - Prevent re-configuring a component if it has already been rendered. A nice optimization suggested by Igor which is especially useful for ajax heavy applications using the hibernate configurator as an application listener. This will remove any overhead for when a component is rendered multiple times.


  - Support any model that implements IPropertyReflectionAwareModelinterface. This opens up the door for users to use other implementations of Model and not be limited to just using a PropertyModel.




The feedback has been great, and I would love to hear more from users about other areas as well.



  - What can be done to allow for drop dead simple integration of this hibernate configurator with other projects?


  - Is there anything preventing you from using this hibernate configurator with your project?


  - What other hibernate annotations would be useful to integrate?




