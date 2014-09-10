---

title: "JDK Source Code in Eclipse"
date: 2004-07-19
comments: false
tags:
 - java
---

I have been interested in the whole "Open Sourcing Java" argument, and one comment I hear frequently is that "If Java was Open Source, I could view where code bugs were and fix/submit them back". The response is usually, "Sun does provide the source code along with the SDK for anyone to view".


Since Sun does provide the source code allong with the SDK, I wanted to try to pull that source code into Eclipse to allow me to debug, not only my application, but also the JDK calls to see how it interacts with other resources (like the filesystem). I also wanted to get the Javadoc for the JDK calls. It was relatively simple to integrate Sun's source code into Eclipse. Here were the steps that I went through:



  1. Go to Window > Preferences > Java > Installed JRE's.


  2. Add a new JRE and point the file system location to the value of your JAVA\_HOME.


  3. Select "rt.jar" and press the "Attach Source" button.


  4. The location should be JAVA\_HOME/src.zip




Now you'll get full Javadoc and be able to browse into Sun's implementation to see where you're getting that Null Pointer Exception! =)


NOTE: There appears to be some kind of problem with running Eclipse with the SDK JVM though. Eclipse seems to think that the class files are out of date, so it frequently cleans out my working directory and rebuilds my entire project. Changing back to use the normal JVM resolves this problem. I would be very interested to hear if anyone else has had this problem.

