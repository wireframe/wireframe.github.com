---

title: "Purpose Of Validation"
date: 2006-05-09
comments: false
tags:
 - java
 - validation
---

There are more than a few validation frameworks out there. Pretty much [every](http://jakarta.apache.org/commons/validator/)[single](http://www.onjava.com/pub/a/onjava/2002/12/11/jakartastruts.html)[application](http://www.springframework.org/docs/reference/validation.html)[framework](http://www.hibernate.org/hib_docs/annotations/reference/en/html/validator.html) out there has rolled their own implementation, and there's no chance of this stopping soon. Sure, each of these frameworks has their own use case, but why does this pattern continue?


The most common misconception developers have about validation frameworks is that it's the validator's job is to make sure data is valid. That's right, I said this is wrong.


What? How can this be? Isn't this the entire reason for a validator's measily existance to validate data? No, the **true purpose for validators is to provide feedback**.


Imagine a simple webapp where a client can enter information. The user goes to an edit screen for the object, which fires a validator when the object is saved. What's wrong with the following scenerio?


```java
public class FooValidator {
  public boolean isValid(Object object) {
    Foo foo = (Foo) object;
    return foo.isValid();
  }
}
```

The problem with this kind of validation is that the object (Foo) may already be in an invalid state. We're relying on client code (FooValidator) to make sure the object is in a "good state", instead of the object being smart enough to prevent invalid state. That means, by simply removing the validator, you're allowing invalid data into your system. Or, if another developer wrote a second edit page, and forgot to register the validator, you've got the same problem.


So, if it's up to the object to keep itself in a good state, what's the purpose of the validator? Simple, to give the user a pretty error message instead of a big fat stacktrace. I would encourage developers to invest more time making their objects "safe", instead of wasting time building more validation frameworks.
