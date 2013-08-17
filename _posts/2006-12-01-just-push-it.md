---
layout: post
title: "Just Push It"
date: 2006-12-01
comments: false
categories:
 - java
 - design
---

Holiday time has come again, and my time available for blogging has shrunk to almost none. This little post continues my series of simple development tips, and builds on a [related post from a while back](http://jroller.com/page/wireframe/?anchor=document_code_with_units_of).



There are times when I run across a procedural block of code and can not for the life of me figure out what's going on. Most of my time is spent trying to understand what the code is really intended to do. For example, here's a little chunk of code that has a bit of an identity crisis. What exactly is it trying to do? Why isn't it more evident what it's purpose is just by reading the code?



```java
public class MyService {
 public void sendReminderEmails() {
   Collection users = userDao.findUsers();
   for (Iterator iter = users.iterator(); iter.hasNext(); ;) {
     User user = (User) iter.next();
     if (user.isActive()) {
       user.sendReminderEmail();
     }
   }
 }
}
```



This is a mighty simple example, but notice how cluttered the code is with logic unrelated to it's core purpose? Now, there are a number of ways to improve this code, and **Pushing Logic **is a simple step towards improvement.



Pushing logic is a simple refactoring trick that helps make code more maintainable and understandable. The idea is that if some piece of code isn't relevant to your current action, it should be pushed Somewhere Else. That magical Somewhere Else can be another class, or a private method of the existing class. The important thing is to get that code out of the way.



From my previous example, a simple change I could make is to try and remove the check for if the user is active. It's a small thing, but it would be nice to assume all the users are active right? So, I'll Push that logic into a new method on the UserDao and rely on it to do the correct logic.



Now, my service is a bit cleaner and removes that extra branching logic.



```java
public class MyService {
 public void sendReminderEmails() {
   Collection users = userDao.findActiveUsers();
   for (Iterator iter = users.iterator(); iter.hasNext(); ;) {
     User user = (User) iter.next();
     user.sendReminderEmail();
   }
 }
}

```



The beauty of this refactoring tip is that it can be applied to any layer of an application. If your business layer begins pushing logic into the dao layer and that code begins to be bloated, you should push that logic out of the dao layer and into a new abstraction to keep that code concise.




technorati tags:[java](http://technorati.com/tag/java), [development](http://technorati.com/tag/development)


