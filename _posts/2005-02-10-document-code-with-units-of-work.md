---

title: "Document Code With Units Of Work"
date: 2005-02-10
comments: false
tags:
 - java
 - documentation
---

Good rule of thumb is: if you feel the need to comment a method body for how a block of code works, work should be extracted in a more understandable way. Either extract the code into a seperate class, or extract it to a shorter, simpler and more expressive method.



Here's a real simple example, but I think it shows the usefulness of this technique.



### Example One


Old code that does all the work and uses comments inside the method body.


```java
public void doStuff(Object myClass) {
  //check that class is in ready state
  if (myClass.getState().equals("Ready For Work")) {
    //do Stuff
  }
}
```



### Example Two


New code that extracts work into easily understandable method.


```java
public void doStuff(Object myClass) {
  if (isReadyForWork(myClass)) {
    //do stuff
  }
}


private boolean isReadyForWork(Object myClass) {
  if (myClass.getState().equals("Ready For Work")) {
    return true;
  }

  return false;
}
```
