---

title: "Fun With Drag and Drop"
date: 2006-01-20
comments: false
tags:
 - java
 - swing
---

It's amazing how the little things can really make a difference for an application. I found myself becoming annoyed when I had to import a PCGen dataset because the Java file chooser would forget the directory location after every restart of the application. I usually have a file browser open with the PCGen files anyways, and that's when the lightbulb came on. Now, instead of having to continually navigate with the crappy Java file chooser, I can just drag and drop the PCGen dataset I'm working with right into shard. The implementation was pretty easy, and it adds an extra bit of polish to the application.



The one problem I had while implementing this new feature was that drag/drop is not supported on all operating systems the same way. So much for Write Once, Run Anywhere. =) There is a [documented bug that's been around since JDK 1.4 that Sun has not fixed that prevents Linux applications from handling drag/drop of files the same as other operating systems](http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=4899516). The [work around](http://www.javadesktop.org/forums/thread.jspa?messageID=128233) is not difficult, and it's not much of a "hack" either. It's more of an inconvenience and frustration point. It took me about 2 hours to figure out why the standard drag/drop tutorials from Sun was not working in my application. I don't know how Sun can let these issues slide through the cracks...



Sometimes Swing programming is more fun than web programming. Sometimes it's not. [Drag and drop with wicket]({% post_url 2005-09-21-wicket-dragdrop-components %}) was a blast, while drag and drop for Swing has kindof left a bad taste in my mouth.
