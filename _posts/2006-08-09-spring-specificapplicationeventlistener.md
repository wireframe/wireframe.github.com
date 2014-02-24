---
layout: post
title: "Spring SpecificApplicationEventListener"
date: 2006-08-09
comments: false
tags:
 - java
 - spring
 - springrcp
---

I often hear complaints from users of the [springframework event listener API](http://www.springframework.org/docs/reference/beans.html#context-functionality-events). It seems that the vast majority of user's end up littering their code with **instanceof** checks to only perform work for specific events. Something like this:



```java
public class MyObject implements ApplicationListener {
  public void onApplicationEvent(ApplicationEvent event) {
    if (event instanceof MyEvent) {
      //do stuff
    }
  }
}
```



Well, here's a simple little solution that should take all that pain away.



```java
public abstract class AbstractSpecificApplicationEventListener implements ApplicationListener {
  private final Class targetClass;

  public AbstractSpecificApplicationEventListener(Class targetClass) {
    this.targetClass = targetClass;
  }


  protected abstract void onSpecificApplicationEvent(ApplicationEvent event);

  public void onApplicationEvent(ApplicationEvent event) {
    if (event.getClass().isAssignableFrom(targetClass)) {
      onSpecificApplicationEvent(event);
    }
  }
}
```



All you need to do now is extend this class, and implement the method you want to do the work. Quite a bit cleaner!



```java
public class MyObject extends AbstractSpecificApplicationEventListener {
  public MyObject() {
    super(MyEvent.class);
  }

  protected void onSpecificApplicationEvent(ApplicationEvent event) {
    //do stuff
  }
}

```
