---
layout: post
title: "Actions Speak Louder Than Words"
date: 2005-07-21
comments: false
categories:
 - testing
---

To be perfectly blunt, I think javadoc is overrated. Yes, I think it's important for public API's or interfaces to be documented, but for the most part, it's unnecessary work. Let me explain why.



Lately, I've been involved in some developer code inspections, and I have come to absolutely loathe them. Here's a brief synopsis of how our code inspections work:



  1. developer hands print out packet of code sometimes the size of a small book.


  2. reviewers read code as if it were meaningful.


  3. reviewers can't comment much since all they're looking for are simple syntax errors that were already caught by the developer's IDE.


  4. reviewers understanding of code is limited to the documentation provided in said code.


  5. reviewers read javadocs as basis for what work is performed in code without really understanding the implementation.


  6. reviewers happily sign off on code as if they made a difference.





What I've come to realize is how pointless it is to review someone else's code in this way. Personally, I don't care "how" they implement it, as long as it works. And within that last statement lies the key to better code reviews. Instead of reviewing someone's code, I would much rather review their unit tests. Reading through a unit test shows you how the code works instead of the javadocs telling you how they work. This is very closely related to my previous post about [using code to document units of work]({% post_url 2005-02-10-document-code-with-units-of-work %}).



Which chunk of code do you trust more?

```java
/**
 * method to do stuff.
 * @param target non-null object to work with.
 * @throws IllegalArgumentException when target is null.
 */
public void doSomething(Object target) {
  //do some work here
  //check for null
  if (null == target) {
    throw new IllegalArgumentException("YOU IDIOT!");
  }
}
```

OR

```java
public void testErrorGeneratedWhenPassedNull() {
  try {
    myObject.doSomething(null);
    fail("Error should have occurred");
  } catch(IllegalArgumentException expected) { }
}
```

As a side note, I think the [developer collaboration tools being integrated into NetBeans](http://collab.netbeans.org) does allow for more meaningful code review since the reviewer can use an IDE to dig into the code. I've tried them out, and would love to see these tools ported to Eclipse.
