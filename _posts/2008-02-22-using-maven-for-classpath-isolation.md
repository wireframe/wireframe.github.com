---

title: "Using Maven For Classpath Isolation"
date: 2008-02-22
comments: false
tags:
 - java
 - maven
---

I'm absolutely obsessed with my application's classpath. I come from a background where projects have ginormous classpaths containing 80+ jars, and classes are imported willy nilly without any thought of the consequences. This is one of the worst things you do to the long term maintainability of your application. Let me give you an example...



Let's say we have a very simple application with a single source tree that integrates with a third party library. Like so...


```java
import com.foo.FooService;

public class FooServiceBridge implements MyService {
 public void doStuff() {
   new FooService.performOperation();
 }
}
```



Now, this third party library may provide a set of "utility" classes that other core parts of your application may find useful.


```java
import com.foo.FooUtils;

public class MyBusinessObject {
 public boolean isValid() {
   return FooUtils.isObjectNull(this);
 }
}
```



Before you know it, you'll find that you'll have references to this third party library littered all over your application. This is absolutely horrible. What happens to the when I want to replace my FooService with a competing library? You should be able to rip out an implementation of one service and replace it with another implementation with no impact to the rest of the application. Using a shared classpath for third party libraries essentially prevents you from migrating from one library to another. Your stuck with what you've got until the day you die. Okay, maybe the day your application dies... =)



I've gone through this process OVER and OVER again. Every time it happens, it makes [a little bunny cry](http://diveintomark.org/public/2006/07/you-make-bunny-cry.jpg).



There is absolutely no way to prevent this coupling from happening unless you can isolate certain libraries at build time into separate classpaths. Maven supports this beautifully by creating a multiproject build where you isolate all code relying on the third party library into it's own module.



Now, instead of having one monolithic source tree/classpath where all classes have access to all libraries, you have two (or three) projects and each project has their own isolated classpath.



  - myproject-core (core business logic with no dependencies on the third party library)


  - myproject-foo (depends on the third party library and provides implementation of core interface)


  - myproject-uberjar (optional - depends on both projects to build up the final runtime classpath)



