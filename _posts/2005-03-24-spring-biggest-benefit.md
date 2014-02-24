---
layout: post
title: "Spring's Biggest Benefit"
date: 2005-03-24
comments: false
tags:
 - java
 - spring
---

Here's a word of warning for all those developers out there that haven't used spring yet, be careful because spring is contagious. I've been working with spring for a couple weeks now and decided to try and integrate it into shard to help out with the management of my hibernate configuration. It worked extremely well. Indeed, it worked so well, I decided to expand my scope and use spring to wire up and manage my velocity configurations as well.


This is when I discovered what I believe to be spring's strongest selling point; Centralization of Configuration. Spring makes it extremely easy to plug in central management points for internal libraries as well as third party packages.


As an example, I was setting up hibernate in my tests by hand which was extremely brittle since actual users may not use the exact same configuration. Now, my tests are able to excersize that my spring configuration is setup correctly.


```java
//old test case setup
public ShardHibernateDbUnitTestCaseSupport(String name) throws Exception {
  super(name);
  File file = new File("src/hibernate/hibernate.cfg.xml");
  sessionFactory = new Configuration().configure(file).buildSessionFactory();
  session = sessionFactory.openSession();
  connection = session.connection();
  connection.setAutoCommit(true);
}
```



```java
//new testcase setup
public ShardHibernateDbUnitTestCaseSupport(String name) throws Exception {
  super(name);
  String[] paths = {"/shard-hibernate-context.xml"};
  context = new ClassPathXmlApplicationContext(paths);
  sessionFactory = (SessionFactory) context.getBean("sessionFactory");
  session = sessionFactory.openSession();
  connection = session.connection();
  connection.setAutoCommit(true);
}
```


Some may argue that this is crossing a boundry and that these tests are no longer unit tests. This may be true, and these may now be considered integration tests, but I have much higher confidence in releasing a project with these kinds of tests over strickly unit tested code. Mainly, I feel more confident that a user will be able to "plug-n-play" with my libraries since I can now test that the spring application configuration is working correctly.
