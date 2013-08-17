---
layout: post
title: "Mocking java.lang.Object methods"
date: 2005-05-11
comments: false
categories:
 - java
 - testing
---

I've run into an issue with mock frameworks not being able to mock out methods from java.lang.Object (hashCode, equals, toString). Here's a simple usecase:



```java
public class SimpleUseCase {
  public void doSomething(Object bean1, Object bean2) {
    if (bean1.equals(bean2) {
      //do interesting work here.
    }
  }
}
```



I've been working with two mocking frameworks, [jmock](http://jmock.org) and [easymock](http://easymock.org). Each of these frameworks have aspects that I like, and I'm not going to go into a comparison of the two right now, but it was very surprising to me that both of these frameworks are unable to be used in testing the above use case.


Easymock has the limitation [stated explicitly at the very bottom of their website](http://www.easymock.org/Documentation.html), but they don't provide alternatives. Here's the documentation provided by easymock:




The behavior for the three object methods equals(), hashCode() and toString() cannot be changed for Mock Objects created with EasyMock, even if they are part of the interface for which the Mock Object is created.




I was able to track down [an issue for jmock](http://jira.codehaus.org/browse/JMOCK-55) to fix this limitation, and according to JIRA, it is supposedly been fixed in CVS. Looking through [the files changed for the issue](http://cvs.jmock.org/viewrep/jmock/jmock/core/src/org/jmock/builder/InvocationMockerBuilder.java) didn't uncover any relevent code or fixes, and there were don't appear to be any test cases for this scenerio either. I'm not sure that this change actually exists, and if it does exist, I don't know what release it is in. It might be sitting in CVS awaiting the next release... Jmock should really try to improve their project roadmap and changelog management.


Unfortunately, the only way I've found around this issue is to not use the standard java.lang.Object methods. Instead of using .equals(), I have been creating a similar method .isSame() (although I should probably name it isEqual()).

