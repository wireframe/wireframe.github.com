---
layout: post
title: "Wizard Validation"
date: 2006-10-09
comments: false
categories:
 - java
 - validation
---

How should validation frameworks integrate with "wizards"? It may take a bit of magic to get these concepts to work together, but I am talking about [software wizards to help users get through a complex workflow](http://en.wikipedia.org/wiki/Wizard_(software)), and not [magical sorcerers from fantasy land](http://en.wikipedia.org/wiki/Wizard_(fantasy)).
   
   
   
   
Here's my issue (in a broad sense):
   
   
   
   
  1. I want to build a wizard to walk me through a complex operation (ex: MyOperation).

   
  2. My wizard has registered a number of validators (ex: NameNotNullValidator).

   
  3. My wizard doesn't display a validated piece of data until a later step. (ex: can't enter the nameuntil step 2).

   
  4. How does the wizard support "delayed" validation until the user has access to the validated field?
   
   
   

   
I've done a lot of work over the past several monthes with Spring RCP, and it seems as if [this usecase has never been addressed](http://opensource.atlassian.com/projects/spring/browse/RCP-406). I've also searched through every framework I could lay my hands on, and none seem to support this scenerio.
   
   
   
   
This usecase seems so basic, so am I totally missing something? Have I gone crazy, or has the rest of the world turned it's back on Wizard Frameworks?
   
   
   
   
   
technorati tags:[java](http://technorati.com/tag/java), [spring](http://technorati.com/tag/spring), [rcp](http://technorati.com/tag/rcp), [validation](http://technorati.com/tag/validation)

