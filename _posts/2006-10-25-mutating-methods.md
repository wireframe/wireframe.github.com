---
layout: post
title: "Mutating Methods"
date: 2006-10-25
comments: false
categories:
 - design
---

Today marks the start of a new series of blog entries that identify common patterns (and antipatterns) that can be applied to everyday programming. It's nothing ground breaking, and is simlar to other sites like [Martin Fowler's blog](http://www.martinfowler.com/bliki/). First up, Mutating Methods.



A Mutating Method is a method that takes a parameter as input and modifies that object directly instead of returning a value. This is definitely an antipattern, and one of my pet peeves. A perfect example of this is Collections.sort(List). There's no return value for this method. It just rewrites your list however it sees fit and there's nothing you can do about it.



Why is this such an issue? Because it completely breaks the assumptions of how methods work. These expectations go all the way back to the assembly days. Procedural logic revolves around the concept of inputs and outputs. By it's very nature, an input parameter is expected to be just that; an input.



It's the same as working with a math equation. When I see 2 + 3 = 5, my brain interprets this as a series of inputs and outputs. 2 and 3 are inputs and the output is 5. This just makes sense. Now, if we applied Mutating Methods to mathematics, we'd have something like: ~~2 + 3~~ 5



Nice...
