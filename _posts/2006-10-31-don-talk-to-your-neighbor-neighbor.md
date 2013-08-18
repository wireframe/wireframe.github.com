---
layout: post
title: "Don't Talk To Your Neighbor's Neighbor"
date: 2006-10-31
comments: false
categories:
 - java
 - design
---

I'll be continuing on the pattern/antipattern postings today, even though it seems that the large majority of people really missed the point of my [previous entry]({% post_url 2006-10-25-mutating-methods %}). I'll try harder to keep things simple, and avoid talking about the much loved static util (anti) pattern.



**Don't Talk to your Neighbor's Neighbor** is an antipattern that is best demonstrated using an example. I'll use the example of a PetClinic charging an Owner after working with their Pet.



```java
public class PetClinic {
 public void charge(Pet pet) {
   Owner owner = pet.getOwner();
   owner.sendInvoice("100 USD");


   //perform other "clinic" paperwork
 }
}

```



Notice how the charge method takes the Pet as a parameter, except it is only used to navigate it's object graph to another object? The charge method is using an initial object (aka: next door neighbor) just to talk to another object (aka: neighbor down the street). This example is very simplistic, and although it seems very obvious, this antipattern can be found everywhere.



How do you avoid this antipattern? Simple. If the only reason you're using a object is to extract data from it, you should depend only on the referenced data and avoid coupling to the initial object. Now, our PetClinic looks like this:



```java
public class PetClinic {

 public void charge(Owner owner) {
   owner.sendInvoice("100 USD");

   //perform other "clinic" paperwork
 }
}

```



Sure, this an ultra simplified example, but notice how the PetClinic is no longer coupled to the Pet class. Less coupling is a good thing!



I'm sure someone will have some comments on the DataObject pattern to refute this one. Since DataObjects are essentially bags of data with no behavior, I'd argue that the DataObject pattern is also an antipattern (although sometimes necessary).



technorati tags:[java](http://technorati.com/tag/java), [antipattern](http://technorati.com/tag/antipattern)

