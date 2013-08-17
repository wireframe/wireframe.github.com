---
layout: post
title: "Untested Equals Broken"
date: 2005-10-05
comments: false
categories:
 - java
 - testing
---

This is an actual email conversation I had today with SomeDeveloper. Am I the only one that finds this ridiculous?



```
SomeDeveloper:
I noticed a lot of the [old functionality] private methods
were removed on one of your previous checkins.
Can we talk about where that functionality went?
Thanks,

SomeDeveloper


Me:
I removed the private methods if they were unused.
The [refactored class] contains any methods
that were only used for [previous functionality].


SomeDeveloper:
I wish you hadn't done that.
I had added them for a reason, and had planned on using them.
```

Unused code is untested code. Untested code is broken code. I'm sorry if there are people out there that have the time to write code that "will be used sometime in the future". I'm afraid I don't have the time to waste writing code that's never used and not needed.
