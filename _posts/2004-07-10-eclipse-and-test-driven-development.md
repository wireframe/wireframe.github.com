---
layout: post
title: "Eclipse and Test Driven Development"
date: 2004-07-10
comments: false
categories:
 - java
 - testing
---

Eclipse has changed my life. Test Driven Development (TDD) has been a major boost to my productivity, and Eclipse has been huge factor in getting me to adopt new development style. Here's my brief experience working with Eclipse and TDD.


Write Your Test Case First

This is one of the toughest parts when starting out with TDD. How can you write a test for classes and methods that don't yet exist? It feels awkward at first, and the seeing "compiler errors" right off the bat, definitely pulls you out of your comfort zone.


```java
public class MyServiceTest extends TestCase {
  public void testDoSomething() {
    MyService service = new MyService();
    assertNotNull(service.doSomething());
  }
}
```


Get Your Test Case to Compile

Now that you have a skeleton testcase, Eclipse makes it a snap to get your testcase to compile. Just use Eclipse's Quick Fix Feature (Ctrl + 1) on your constructor to create a new empty class. Then use the quick fix on the method call to create an empty method in your new class. BOOM! Just like that, you're almost up and running.


Get Your Test Case to Pass

Since your testcase compiles now, try running it and see it's failure. From here, implement the method as you need to in order to get the testcase to pass. Just remember to implement it in the simplest way possible. Refactoring comes later.


Test Driven Development has pushed me to keep my architecture simple, and Eclipse has been a huge help to get code and tests up and going as fast as possible. Many thanks to whoever introduced the "Quick Fix" into Eclipse and got it to work so well!

