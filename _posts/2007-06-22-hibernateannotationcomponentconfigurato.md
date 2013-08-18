---
layout: post
title: "HibernateAnnotationComponentConfigurator"
date: 2007-06-22
comments: false
categories:
 - java
 - hibernate
 - wicket
---



It's been an impressively difficult task to improve upon the [initial version of my Wicket/Hibernate integration]({% post_url 2007-05-08-hibernate-annotations-and-wicket %}), but I finally hit a break through. Introducing the new HibernateAnnotationComponentConfigurator. _Long enough name for you?_=)




This object is used to configure a Wicket Component based on Hibernate annotations. It inspects the Model of a FormComponent and configures the Component according to the declared Hibernate Annotations used on the Model object. This means the Component's Model_must_be known when configuring a Component.




This object can be used as a Behavior to configure a single Component. NOTE: This object is stateless, and the same instance can be reused to configure multiple Components.



```java
 public class MyWebPage extends WebPage {
   public MyWebPage() {
     TextField name = new TextField("id", new PropertyModel(user, "name");
     name.addBehavior(new HibernateAnnotationComponentConfigurator());
     add(name);
   }
 }
```




This object can also be used as a component listener that will automatically configure _all_FormComponents based on Hibernate annotations. This ensures that an entire application respects annotations without adding custom Validators or Behaviors to each FormComponent.



```java
 public class MyApplication extends WebApplication {
   public void init() {
     addComponentOnBeforeRenderListener(new HibernateAnnotationComponentConfigurator());
   }
 }

```





I'm extremely excited that it is now possible for an _entire application_to automatically use Hibernate annotations without any extra work. As far as I know, this is a first for _any_ Java web framework and just goes to show how much Wicket rocks.




So, what are you waiting for? Start using this today by [downloading the latest build](http://www.wicketstuff.org/maven/repository/org/wicketstuff/wicketstuff-hibernate/). Maven2 users have it even simpler by adding this to your POM.xml file:



```xml
&lt;repositories&gt;
  &lt;repository&gt;
    &lt;id&gt;wicket-stuff-repository&lt;/id&gt;
    &lt;name&gt;Wicket-Stuff Repository&lt;/name&gt;
    &lt;url&gt;http://www.wicketstuff.org/maven/repository/&lt;/url&gt;
  &lt;/repository&gt;
&lt;/repositories&gt;

&lt;dependencies&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.wicketstuff&lt;/groupId&gt;
    &lt;artifactId&gt;wicketstuff-hibernate&lt;/artifactId&gt;
    &lt;version&gt;1.3-SNAPSHOT&lt;/version&gt;
  &lt;/dependency&gt;
&lt;/dependencies&gt;
```
