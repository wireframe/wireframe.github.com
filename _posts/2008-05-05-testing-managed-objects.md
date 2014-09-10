---

title: "Testing Managed Objects"
date: 2008-05-05
comments: false
tags:
 - java
 - testing
---

My definition of "Managed" Objects:


Objects that are manipulated by a separate container with a pre-defined lifecycle.



Managed Objects are a very standard part of development projects.



  - JSP taglibs are managed by the servlet container


  - ant/maven tasks are managed by their respective execution environment


  - tapestry/wicket components have a managed rendering lifecycle




Unit testing these managed objects "correctly" is very difficult since you need in depth knowledge of how these objects will be invoked within the container. In my personal experience, it is best to extract as much logic out of your managed objects into standard POJO's and unit test the heck out of them. The managed objects then become a very slim wrapper around your core business objects. Unit testing your POJO gives you the most bang for your buck versus actually unit testing the managed object.



To actually unit test your managed objects, it is very important to test them within the actual container. This may qualify as more of an integration test instead of a standard unit test, but that's fine by me. The alternative is to write your unit test to invoke the managed object by emulating the behavior of the container. I have never had a high level of confidence that my "emulated container" is doing things 100% the way the "real container" will. Especially since containers do not necessarily adhere to the published lifecycle specification *cough* every JSP servlet container *cough*. Since one of the core purposes for unit tests is to remove fear of making changes, these integration tests are vital to ensure your object really works as you expect.



Some libraries provide lightweight stubs of their container in order to facilitate these kinds of integration tests. Spring has a whole suite of [abstract JUnit TestCase classes](http://www.infoq.com/articles/testing-in-spring) to make in-container testing a breeze. Wicket provides an excellent [WicketTester class]() to stub out the wicket runtime to execute your managed object in isolation without firing up an entire application. Maven has a [few competing options](http://maven.apache.org/plugin-developers/plugin-testing.html) and they all suck pretty bad (but at least they're trying). Anyone here remember the supposed ["holy grail" of in-container testing](http://jakarta.apache.org/cactus/)? Wow, that brings back bad memories...



