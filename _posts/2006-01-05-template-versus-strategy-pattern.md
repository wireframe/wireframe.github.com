---
layout: post
title: "Template Versus Strategy Pattern"
date: 2006-01-05
comments: false
tags:
 - java
 - design
---

Are you ready for a design pattern throw down?



I've been involved with a development reading group for the [Head First Design Patterns](http://www.oreilly.com/catalog/hfdesignpat/) book.  Overall, it's a really good book, and last night there was some interesting debate comparing the Template and Strategy patterns.  Both pattern's intent is to push unique behavior into seperate objects. My argument was that the Template pattern should be banished to the dark side of the moon since it forces use of class inheritance instead of object composition.



The template pattern defines the "hook" template methods for subclasses as protected.  That means that in order to unit test the unique behavior, you have to test the main public entry point, which may have a considerable amount of setup/teardown overhead. This makes testing what really matters more difficult than it should be.



Here's a simple example using Java psuedocode.  Notice how in order for me to unit test the importObject(String line) method of my extension class, I have to unit test all of the file IO.  It's a bit basic, but if that behavior was promoted to a strategy, you could unit test it without any file system dependencies.  Something like LineObjectImporter.importObject(String line) would do just nicely. +1 for testability!



```java
public class AbstractFileImporter {
  public Collection importObjects(File file) {
    Collection results = new ArrayList();
    InputReader input = new FileInputReader(file);
    while (input.isActive()) {
      results.add(importObject(input.getLine()));
    }
    input.close();
    return results;
  }
  protected abstract Object importObject(String line);
}
```

Although I favor the Strategy pattern, there does seem to be a quicker "up and running" time when using the template pattern.  There's just something inherently easy (pun intended) about extending a parent class and only implementing a few methods.
