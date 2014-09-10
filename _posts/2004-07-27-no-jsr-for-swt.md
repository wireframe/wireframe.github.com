---

title: "No JSR for SWT"
date: 2004-07-27
comments: false
tags:
 - java
 - swt
---

I don't believe that SWT will ever make it as a JSR. It is a very good library and has done the Eclipse project well, but it should not become a Java standard. SWT libraries have only been ported to a few operating systems, and they have only been ported "well" to Windows. The reason SWT came around was because Eclipse ran into issues with Swing and decided to roll their own windowing toolkit to do what they needed to do. More power to them for doing that, but acceptance as a JSR means that SWT must be available for every platform that runs Java, otherwise what good is it to the Java "community"?


SWT is the first Java API that I know of that totally breaks the concept of "Write Once Run Anywhere". If a JDK is available for an operating system, any Java application should be able to run on it. This is simply not the case with SWT, since it relies on the API to be ported to each operating system. SWT's notion of [resource de-allocation](http://www.developer.com/java/other/article.php/10936_2179061_2) also seems like a step backward for a Java API.


The JDK already has two windowing kits (AWT and Swing) that are tested on every available platform that the JDK is available. Introducing another toolkit as a Java standard would require that for every platform the JDK is available, the new toolkit must be tested and ported as well. It doesn't seem to make much sense when there are already two API's available.


Some people want SWT because it "looks" better. Well, I suggest they take a look at the [JGoodies Project](http://www.jgoodies.com) to see their mock up of Eclipse using Swing. I was very impressed to see that it could be done, but I haven't looked at the code to see how difficult it was to do it.


If Swing's cross platform performance was the reason they created SWT, why not allow IBM to roll their own Swing implementation that ignores the cross platform look and feel, and uses the native calls just like SWT? Sure, applications wouldn't have the same look and feel on all platforms, but you'd get the best of both worlds.

