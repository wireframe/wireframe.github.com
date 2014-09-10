---

title: "Running Code Doesn't Lie"
date: 2006-04-25
comments: false
tags:
 - java
 - documentation
 - testing
---

My reading group recently finished [Head First Design Patterns](http://www.oreilly.com/catalog/hfdesignpat/) and is now diving into [Domain-Driven Design](http://domaindrivendesign.org/book/).  So far, it has really opened my eyes to a new approach to software development.  I'm not going to review the book here, but there's one statement that really caught my eye.



Running code doesn't lie.



This statement pretty much sums up why agile software development practices like [eXtreme Programming](http://www.extremeprogramming.org/) and [Getting Real](https://gettingreal.37signals.com/) are so powerful.  Instead of business analysts or programmers writing pages of documentation for what they think the system does, the system tells you what it does.  I like to call this a Self Describing System.



The cost of maintaining two sources of documentation is just too high.  Eventually one or the other will fall out of synch and become irrelevant (even dangerous).  The code is the only true source for understanding how a system works.  Now, I don't expect everyone to go to the code to understand how a system works, and I'd be the last person to allow business people to start digging around in my source code.  Instead, I am advocating that the codebase be the definitive source for relevant documentation. 



There are a number of tools out there than can give insight into code [quality](http://checkstyle.sourceforge.net/) or [system metrics](http://pmd.sourceforge.net/), but most of these tools are far too technical and completely meaningless to a business person.  But, there are tools out there that can give important contextual information for anyone to understand. [TestDox ](http://agiledox.sourceforge.net/)is one of these tools, and it has really driven me to look into this area more.



TestDox generates reports describing a system's features using unit tests as it's source.  This may sound like a simple feature, but I find it incredibly powerful.  Take the following unit test:



```java
public class DogTest extends TestCase {
  public void testDogWalksWhenYouKickIt() {
    Dog dog = new Dog();
    Person me = new Person();
    me.kick(dog);

    assertTrue(dog.isWalking());
  }

  public void testDogBarksWhenSitsDown() {
    Dog dog = new Dog();
    dog.sit();

    assertTrue(dog.didBark());
  }
}
```

would generate the following:

```
Dog
- dog walks when you kick it
- dog barks when sits down
```


There you have it!  A Self Describing System for free!  No additional documents.  No extra frameworks or meta programming.  Just straight up unit tests and a simple report generator. 


I'd love to see more work done to improve this.  First of all, the reports could use a *lot* of prettying up.  A [maven2 plugin](http://maven.apache.org) would be great as well.  The source for this project is not too complex, so I might have to roll up my sleeves and try to make some improvements myself. 

