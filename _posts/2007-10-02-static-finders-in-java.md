---
layout: post
title: "Static Finders in Java"
date: 2007-10-02
comments: false
categories:
 - java
 - database
---

For the past couple days, I've been unnaturally obsessed with the Ruby syntax for looking up persistent objects. The [ActiveRecord find API](http://railsmanual.org/class/ActiveRecord::Base/find/1.1.2) is absolutely a piece of art.



```ruby
# returns the object for ID = 1
Book.find(1);
```



While Java API's force developers to think about Services and DAO's, Ruby/ActiveRecord focuses on the Domain Model which is all that really matters. I've [said this in the past]({% post_url 2006-07-17-humane-object-iteration %}), it's all about context. We need to be creating expressive and simple API's that enable developers to build applications without being constrained by the underlying architecture.



What if we could have the best of both worlds? Why don't we see this kind of Ruby syntax in Java applications? Is it because of the assumption that [static methods are evil](http://beust.com/weblog/archives/000173.html)? Java developers have a lot to learn from Ruby, and here's how to build a Ruby-like finder method in Java.



I'll start with my client code. It needs to be simple and not worried about Services or Daos to lookup my persistent objects.



```java
public class BookLister {
 public void printBooks() {
   foreach (Book book : Book.findAll()) {
     System.out.println(book.getName());
   }
 }
}

```



Next, we need expose this finder method on our business object. Don't worry, I'm not advocating that we perform some magic hack to manually create database connections within these methods. We'll use standard dependency injection techniques and encapsulate the database access within a standard DAO object and delegate the call from the business object to the DAO.



```java
public class Book {
 private static BookDao dao;
 private String name;

 public static Collection findAll() {
   return dao.findAll();
 }


 public static void setBookDao(BookDao dao) {
   this.dao = dao;
 }
}

```



Our final step is to configure the business object to have access to the DAO. This is super simple for a Spring application, and I'd be very interested to see if something like Guice could be used instead of this XML configuration. Or maybe build some custom Annotations?



```xml
&lt;beans&gt;
   &lt;bean id="bookDao" class="com.mysite.BookDao" /&gt;

   &lt;bean id="bookInit" class="com.mysite.Book"&gt;
       &lt;property name="bookDao"&gt;&lt;ref bean="bookDao" /&gt;&lt;/property&gt;
   &lt;/bean&gt;
&lt;/beans&gt;
```
