---
layout: post
title: "Spring Rich Event Processing Bus"
date: 2006-07-12
comments: false
categories:
 - performance
 - java
 - spring
 - springrcp
---

For the past few weeks I've been working with spring rich to try and build a simple solution for performing units of work within the gui framework, but so far, [my solution has been anything but simple](http://jroller.com/page/wireframe/?anchor=crazy_command_composition).



I started becoming very interested in this area after reading [a blog on how Spring could be more tightly integrated with Swing for thread management](http://www.ditchnet.org/wp/2005/06/05/remedial-spring-rcp-episode-2-targetableactioncommands-and-the-edt/). Container managed threading, essentially. I've taken a lot of inspiration from that blog, and have formed it into something that's actually usable.



The solution I've come up with leverages the [spring application event framework](http://static.springframework.org/spring/docs/2.0.x/reference/beans.html#context-functionality-events) to fire processing of these GUI specific actions. I call it an **Event Processing Bus**. Here are a few specific use cases that my current solution supports:




  - Perform long running operation in a background thread.


  - Prevent UI from locking up while operation is being performed.


  - Provide user feedback for progress of operation.


  - Prevent user input until operation is complete.




For starters, I did not want to couple my business layer to Spring. Heck, I didn't even want to implement the Spring ApplicationListener interface. I just wanted a simple POJO that would perform work on a published event.



```java
public class MyService {
  public void processApplicationEvent(MyEvent event) {
    //perform operation with event
    Thread.sleep(1000); //just for fun

  }
}

```



Wiring this object in Spring is now _much_simpler than [my previous incarnation](http://jroller.com/page/wireframe/?anchor=crazy_command_composition). Simply wrap your business object in the EventTriggeredProgressMonitoredBackgroundCommandExecutor and tell it what method to invoke. It'll take care of the rest!



```xml
&lt;bean id="myService"
 class="org.myproject.MyService"&gt;
&lt;/bean&gt;

&lt;bean id="myCommand"
 class="com.codecrate.shard.ui.command.EventTriggeredProgressMonitoredBackgroundCommandExecutor"&gt;
  &lt;constructor-arg&gt;&lt;value&gt;org.myproject.MyEvent&lt;/value&gt;&lt;/constructor-arg&gt;
  &lt;constructor-arg index="1"&gt;&lt;ref bean="myService"/&gt;&lt;/constructor-arg&gt;
  &lt;constructor-arg index="2"&gt;&lt;value&gt;processApplicationEvent&lt;/value&gt;&lt;/constructor-arg&gt;
&lt;/bean&gt;
```



Thus far, I haven't shown any details on how this helps Spring Rich GUI applications. It has just been using the core spring framework to wrap event processing in background threads. But this solution really shines when you want to change your service to provide user feedback. Simply update your service to take a Spring Rich ProgressMonitor, and without updating any configuration files, your service will be invoked correctly.



```java
public class MyService {
  public void processApplicationEvent(MyEvent event, ProgressMonitor progressMonitor) {
    //perform operation with event
  }
}

```



Here is where my solution really differentiates from a simple _background thread event processer_. The EventTriggeredProgressMonitoredBackgroundCommandExecutor doesn't simply pass the application event to the target object, it allows for more information to be placed in the context so that the target object can have access to that information as well.



I'd like to invest some more time to see if I can invoke operations without always blocking user input. Blocking user input is definately the "safest" solution, but it would be nice to execute operations in the background and allow the user to continue working.

