---
layout: post
title: "Performance Testing using JUnit"
date: 2007-08-17
comments: false
categories:
 - performance
 - java
 - testing
---

I've been heavily involved with a major performance initiative for the past several months. One thing I have constantly found frustrating is how few good tools exist for this type of work. Specifically, I have yet to run across a good Java library for programatically measuring performance metrics.



You may be quick to try and point me to [JUnitPerf](http://clarkware.com/software/JUnitPerf.html), but let me stop you right there and tell you that JUnitPerf is utter crap. It is simply a cobbled together set of incoherent API's that are more effort than their worth. They had the right idea, but their end product is rubbish.



What do I have that's any better? Let's start with this as our base class:


```java
public class PerformanceTestCase extends TestCase {

 protected void assertFasterThan(long millis, Runnable runnable) {
   long start = System.currentTimeMillis();
   runnable.run();
   long executionTime = System.currentTimeMillis() - start;

   assertTrue("Expected execution time to be less than " + millis + " but was " + executionTime, executionTime  }
}

```



Using this little base class, I can start to write a real performance test using a standard JUnit API like so:


```java
public class MyObjectTestCase extends PerformanceTestCase {

 public void testMyOperationIsFasterThanTheSpeedOfLight() {
   //perform setup here
   final MyObject object = new MyObject();
   Runnable work = new Runnable() {
     public void run() {
     //do work that should be measured here
     object.doStuff();
     }
   };

   assertFasterThan(10, work);
 }

}
```



Using assertFasterThan is a good start, but anyone who's done real performance testing knows that there are lots of factors that cause fluctuations in the execution speed of code. This is especially true when your building integration tests that interact with databases or other resources. To get a more reliable metric, we need to execute the same block of code multiple times and grab the average. Here's an new method to perform just that.


```java
protected void assertAverageFasterThan(long millis, Runnable runnable, int numberOfExecutions) {
  long start = System.currentTimeMillis();
  for (int x = 0; x &lt; numberOfExecutions; x++) {
    runnable.run();
  }
  long executionTime = System.currentTimeMillis() - start;
  long average = executionTime / numberOfExecutions;

  assertTrue("Expected average execution time to be less than " + millis + " but was " + average, average <= millis);
}
```



Now, I can execute my code a number of times to make sure that one slow (or fast) execution doesn't skew my results.


```java
public class MyObjectTestCase extends PerformanceTestCase {
  public void testMyOperationIsFasterThanTheSpeedOfLight() {
    //perform setup here
    final MyObject object = new MyObject();
    Runnable work = new Runnable() {
      public void run() {
        //do work that should be measured here
        object.doStuff();
      }
    };

    //execute the block of code 100 times and take the average
    assertAverageFasterThan(10, work, 100);
  }
}

```



Before I finish, let me remind everyone:


[Early optimization is the root of much evil.]({% post_url 2006-04-13-performance-is-overrated %})



These tools and techniques should be used sparingly and only under the supervision of a licensed therapist. =)

