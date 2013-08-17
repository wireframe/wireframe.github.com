---
layout: post
title: "Wicket Client Side Validation"
date: 2008-01-27
comments: false
categories:
 - java
 - wicket
 - ajax
 - validation
---

Over the past several weeks, I've been been seeing lots of posts for [fancy](http://extjs.com/deploy/ext/examples/form/dynamic.html)[Javascript](http://www.jsvalidate.com/)[validation](http://tetlaw.id.au/view/javascript/really-easy-field-validation) libraries. I spent a couple weeks playing around with integrating these libraries into Wicket, but something didn't feel quite right. Giving users instant feedback when filling in data forms is *really* nice, but what is the best way to support it?



Before we can really dive into the issue of client side validation, we must first be perfectly clear that server side validation is absolutely critical. There is no question that we *need* validation done on the server side to prevent a user bypassing validation just by turning off javascript.



If server side validation is mandatory, how do you add client side validation with the least amount of work? I mean, how do you get the "most bang for your buck" and not have to re-do all of the server side validation rules with custom code on the client side? The trouble is, server side validation runs in Java, and client side validation runs in Javascript. How can these two languages perform the *exact* same validation rules without a LOT of extra work? How do you get *cohesive*, *localized* messaging for both server side and client side validation errors? I have yet to see a Javascript validation library that handles localized messages as robustly as Java validation frameworks.



My answer? Use Ajax.



Instead of re-implementing all of the server side validation rules in Javascript, just use Ajax to call into the server to perform the REAL validation and give the user feedback. The user gets instant feedback, and we don't have to "jump through hoops" and write separate Javascript validation libraries to do what is already supported on the server side.



Wicket handles this beautifully with the AjaxFormValidatingBehavior.


```java
public class MyForm extends WebPage {
 public MyForm() {
   add(new FeedbackPanel("feedback").setOutputMarkupId(true));

   Form form = new Form("form", new CompoundPropertyModel(new MyObject())) {
    public void onSubmit() {
      //do something
    }
  });
  add(form);

   TextField name = new TextField("name");
   name.setRequired(true);
   form.add(name);

   AjaxFormValidatingBehavior.addToAllFormComponents(form, "onblur");
 }
}
```



Boom! Just like that, you have client side validation in Wicket. In this example, the user will get an error message if they try to leave the name field blank. Seriously, can it get any easier than this? Actually it can, if you use hibernate annotations, your Wicket component can [automatically configured instead of having to manually set requiredness or add validators](http://jroller.com/wireframe/entry/wicketstuff_hibernate_updates). You could also automatically attach this Ajax behavior to all of your forms by using a ComponentInstantiationListener.



Some people may complain that this is no longer "client side" validation since we're making a call to the server. So WHAT!?! I will gladly pay the cost to have this done on the server where I'm *guaranteed* to have the correct validation rules fire. There is a definite risk of a possible mismatch between the client side and server side validation rules since they are written in two completely different languages. It's all too plausible for a javascript validator to have different syntax rules than the server side rules which could ultimately lead to preventing users from entering data that passes the server side validation rules. This may not be a worry for simple "is required" validation, but email address and phone number validation is much more complex and changes between implementations.



[Matt Raible gave Wicket low marks in this area](http://raibledesigns.com/rd/entry/comparing_jvm_web_frameworks_presentation) because no fancy javascript validation libraries are built into Wicket like in [Tapestry](http://tapestry.apache.org/tapestry4.1/usersguide/clientside-validation.html), but I don't understand why? In my mind, as long as you're giving the user instant feedback, there's no real difference between:



  1. executing Javascript validators


  2. using Javascript to call serverside validation





Thoughts?

