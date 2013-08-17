---
layout: post
title: "How Prototype Can Break Your Site"
date: 2006-07-28
comments: false
categories:
 - javascript
---

I have really grown to like [prototype](http://prototype.conio.net/) and all of the extensions it brings to Javascript. The more I use it, the harder it is for me to use standard Javascript for certain operations (ajax, looping, etc).



Unfortunately, my day job project does not use prototype, and there's been quite a bit of resistance to adopting it. The main argument against using prototype in our application is that it will break a small number of legacy Javascript.



What? Prototype can **break** existing scripts? That's right, and although it's only one use case in a small number of scripts, now everyone has become gun shy around adopting prototype. I'll try to describe the problem. First, here is a simple example that will demonstrate the issue.



```javascript
var a = new Array();
a[0] = 1;
a[1] = 2;
for (var i in a) {
  print(i + " = "+ a[i]);
}
```



Now, before prototype is added to the page, this Javascript will have the following output:



```
0 = 1
1 = 2
```



After prototype is added to the page, the for loop acts differently and also iterates over the methods that Prototype has added to the Array object. Now, the output looks like this:




```
0 = 1
1 = 2
each = function() { }
iterate = function() { }
```



There are two sides of the camp when it comes to this problem, and both sides are **very** passionate that they are right and the other is wrong. One side blames prototype for modifying core Javascript objects. I have a feeling that this group would not appreciate Ruby's ability to dynamically add methods to any object. The other side blames Javascript developers for using a dangerous version of the for loop. From what I've read, using [this style of for loop for iterating over associative arrays works, but it's not correct](http://www.andrewdupont.net/2006/05/18/javascript-associative-arrays-considered-harmful/).



```javascript
//this style of for loop is really intended for iterating over a hash
//or for working with an object as a hash of properties
for (var property in object) {
  print(property + " = "+ object[property]);
}


//this is the correct way to iterate over an array.
for (var x = 0; i  print(x + " = " + array[x]);
}
```



So, there are definitely options for getting around these issues. One is to update existing Javascript to use correct array iteration. Heck, since you're integrating prototype, might as use their [kick ass object iteration syntax](http://jroller.com/page/wireframe/?anchor=humane_object_iteration)! If updating your current scripts isn't an option, there are [wrapper scripts that will allow developers to control which Javascript functions get the special prototype syntax](http://ajaxian.com/archives/prototypify-running-prototype-code-with-legacy-code). This would allow you to add prototype without breaking existing scripts.



Realistically, this is only an issue if you're trying to bring prototype into a legacy project. If you're starting a new project, do **not** hesitate to use prototype. It's simply a no brainer.
