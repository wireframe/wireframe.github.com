---

title: "Oh JSP, How I Hate Thee"
date: 2006-10-18
comments: false
tags:
 - jsp
---

The title says it all. It's poetry, and I'm the **code\_poet** right?



I'm currently working on a project to migrate our web application to tomcat. Our current appserver is a pile of dung and this upgrade has been a long time coming. I was not expecting this to be easy given how large our application is, but I wasn't expecting us to have to change nearly every single JSP in our application. That's right, tomcat can't compile over two thirds of our JSP's, and it's largely because of one issue. Here's an very simple example of our current JSP's that tomcat can't handle.




```html
&lt;bean:define id="targetUser" value="Ryan"/&gt;

&lt;logic:equal name="currentUserName" value="&lt;%= targetUser %&gt;"&gt;
  &lt;!-- do something special --&gt;
&lt;/logic:equal&gt;
```



Looks pretty standard right? Why in the world could our current crappy app server handle this, and the industry standard, servlet specification reference implementation, appserver not? It all comes down to differences in how the JSP is transalted to Java bewteen the two appservers.



The bean:define tag creates an instance of an Object. The logic:equal tag requires a String for the value attribute. Now, our crappy appserver is smart enough to try and cast the object from an Object to a String, but tomcat refuses to try and help a brother out in this simple little way. Tomcat requires you to perform the cast yourself like this:



```html
&lt;logic:equal name="currentUserName" value="&lt;%= (String)targetUser %&gt;"&gt;
```



Oh JSP, How I Hate Thee.



Yes, this is more of a Jasper issue than Tomcat, but I refuse to accept that the industry standard servlet container can't handle this. At the very least, it should be mandated by the Servlet specification so that each appserver handles this the same way.
