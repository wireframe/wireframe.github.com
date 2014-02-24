---
layout: post
title: "The Real World"
date: 2005-10-10
comments: false
tags:
 - testing
---

I must say that I'm a bit suprised at the number of people who seem genuinely angry because of my previous posts. I could take this opportunity to try to calm people's fears, or to clarify my opinions. But, what's the point? How about I just add more wood to the fire?



After I gave my presentation on FIT, I had a number of developers come up and ask me questions about testing (unit, integration, acceptance). Generally, people were very interested and had great suggestions on how to apply testing to their own work. There was one conversation that nearly drove me up a wall, and it went a little something like this:



```
AnotherDeveloper:
Great presentation!
I'm wondering how I can use FIT to test my Spring MVC controllers?


Me:
Ummmm....Spring MVC is a GUI layer, right?
It's extremely difficult to test *any* GUI layer.
But it should be really easy to extract the business logic into
non-GUI specific code and test that.


AnotherDeveloper:
Well ideally, yes we should do that, but this is the "real world".
So, how can I "fix FIT" to create servlet request/response objects?
```

This is just another example of people that just don't "get it". I personally *guarentee* that it would be less work for AnotherDeveloper to extract and test the business logic instead of trying to hack FIT to test their Spring MVC code.
