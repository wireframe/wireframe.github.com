---

title: "Humane Object Iteration"
date: 2006-07-17
comments: false
tags:
 - ruby
 - javascript
 - java
---

Over the past several months, I've been exposed to more language features than ever before. I've been working with Javascript, Java, and I'm starting to be exposed to Ruby as well.



One thing that has really started to bother me about Java (compared to these other languages), is all of the _cruft_ that is required when trying to get stuff done. Specifically, in this blog, I'm talking about object iteration. This is a standard feature in any modern programming language, yet Java seems to have the most bulky and convoluted solution for "out of the box" object iteration.



```java
for (Iterator i = collection.iterator(); i.hasNext(); ) {
  Object myObject = i.next();
}

```



Now, I don't want to hear about the [Java 1.5 enhanced for loop](http://jcp.org/aboutJava/communityprocess/jsr/tiger/enhanced-for.html). It still falls short of an acceptable solution and is more of a bolt on feature than anything else. I'm sorry, but this Java iteration is far less appealing after being exposed to the Ruby or Javascript syntax.



Object Iteration In Javascript (with Prototype)

[Prototype](http://prototype.conio.net/) has greatly increased the usability of Javascript by providing a much more elegant approach than the standard for loop.


```javascript
$$('myElements').each(function(element) {
  //do something with the object
});

```



Object Iteration In Ruby

Ruby takes the cake when it comes to easy object iteration.


```ruby
user.getDepartments().each do |object|
 #do something with the object.
end

```



After being exposed to the Javascript and Ruby syntax, I became bound and determined to bring something similar to Java. Unfortunately, since Java does not have the same flexability as Ruby or Javascript to inject new methods into core classes, the solution is nowhere near as elegant.



Object Iteration In Java With Ruby-like Syntax (Version One)

My first stab at doing this in Java was to extract a static util class that would do the iteration and provide a callback for custom code.


```java
CollectionUtil.each(user.getDepartments(), new ObjectVisitor() {
  public void visit(Object object) {
    //do something with the object.
  }
});

```



Here's the simple little utility class that performs the iteration.


```java
public class CollectionUtil {
  public static void each(Collection collection, ObjectVisitor visitor) {
    for (Iterator i = collection.iterator(); i.hasNext(); ) {
      Object object = i.next();
      visitor.visit(object);
    }
  }
}

```



Also need to define this slim little interface to create the anonymous inner class from.


```java
public interface ObjectVisitor {
  public void visit(Object object);
}
```



Now, this was not a bad solution, but static util classes are not Object Oriented. Yep, that's right. Anyone who comes up to me and suggests that I throw some "helper" methods in a "utility" class will get a swift kick to the head. Unfortunately, Java is littered with Util classes ([StringUtil](http://www.jedit.org/42docs/api/bsh/StringUtil.html), [FileUtil](http://www.javazoom.net/jlgui/docs/docs2.2/javazoom/Util/FileUtil.html), [DBUtil](http://www.cs.unm.edu/~wzhao/spo/javadocs/api/spo/src/SPDB/Util/DBUtil.html)). This is largely because of it's limitiation to not allow you to extend the core classes. Ruby has taken a very different approach and allows for developers to extend core classes and add any method you see fit.



Java also chose the [minimalist route](http://www.martinfowler.com/bliki/HumaneInterface.html) when designing it's API's, and created it's interfaces with the bare minimum number of methods to allow developers to get their work done. This has forced developers to turn to procedural Util classes to do the work that other languages have built in.



Just for fun, I wanted to take another try at doing this "Java iteration with Ruby syntax". This time, I used Spring as an example for how to approach this solution. [Spring](http://www.springframework.org) is the absolute king of Java frameworks right now, and one interesting design philosophy they have is to provide extention points within their "templates" for your custom code. The [HibernateTemplate](http://www.springframework.org/docs/api/org/springframework/orm/hibernate/HibernateTemplate.html) is a perfect example where Spring abstracts away all connection and lifecycle handling and provides a single extension point for all custom code.



So, here's my second attempt of providing a cleaner way to iterate over objects in Java. This time, no static util classes were needed.



Object Iteration In Java With Ruby-like Syntax (Version Two)

```java
new IteratorTemplate(Collection objects) {
  protected void onEach(Object object) {
    //do something with the object.
  }
}.iterate();

```



This object is doing the same work as the static util class. But, this solution removes the extra interface class, and instead uses a protected method as the extension point.


```java
public abstract class IteratorTemplate {
  private final Collection objects;

  public IteratorTemplate(Collection objects) {
    this.objects = objects;
  }

  public void iterate() {
    for (Iterator i = objects.iterator(); i.hasNext(); ) {
      Object object = i.next();
      onEach(object);
    }
  }

  protected abstract void onEach(Object object);
}
```

Now, I for one, really prefer this new "template" approach. It's still not as elegant as Ruby, but I think this is definately a step up from the current standard Java solution for (Iterator blah blah blah).



I've repeatedly said that Ruby doesn't do anything that Java can't do, it just does it differently. I fully believe that the Java solution is comparable to the Ruby solution, it's just that the Ruby solution is much more elegant and understandable. The Ruby code is clearer and gives the important code much more **context**. Invoking an operation directly on an object has much more meaning that passing an object to another process to perform the work. For example, myString.isEmpty() reads **completely** different than StringUtil.isEmpty(myString).



Context is everything. Our brains work a certain way and some languages are more intuitive than others because they operate more inline with how we think. Ruby and Javascript should get their due credit for designing API's that are more intuitive that anything I've worked with thus far.

