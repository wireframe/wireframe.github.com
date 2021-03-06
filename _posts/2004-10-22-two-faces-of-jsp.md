---

title: "The Two Faces of JSP"
date: 2004-10-22
comments: false
tags:
 - java
 - jsp
---

The same reason I have come to hate JSP is the same reason many other developers love it; it's super flexible and has a wide range of functionality. Well, I think that JSP's are TOO flexible for their own good. I'll go out on a limb and state that, "Using JSP's inherently leads to poor application design". This is a bold statement, and I realize that it is not true 100% of the time. Here's my rationale:

  - There are no failsafes to STOP you from going overboard and doing all of the work in each JSP. Heck, there's no way to even run something like checkstyle on a JSP. Has anyone out there looked at the java source of a translated JSP file?
  - Translated files lead to tough troubleshooting. Seeing an error message saying there's a problem with line 2000 of my jsp (when the jsp is only 200 lines long), does not help much.
  - No unified direction to do operations or perform work. If the development and site design teams are seperated, there is no way to know when a JSP has done work inefficeintly or incorrectly like using scriptlet instead of custom tag.
  - In a vast majority of JSP projects, little hacks here and there sneak into JSP's (custom scriptlets or using more and more custom tags, etc) until a bloated mess is all you are left with.
  - Confusion of responsibilities. Their is a contradiction of sorts depending on who is creating the application. If a software developer is creating a web application, they want absolute control over the application from any layer (including the JSP view). "Give me SQL tags so I can query/update databases. I need to ftp files using custom tags." If a html developer is creating a web application, they don't want 10,000 different ways of getting the same result. They want the "work" done elsewhere, and they handle the output and formatting.
  - Error pages not displayed correctly. If any "work" is done inside a jsp (like using a custom tag), the content has already started to stream back to the user, and any error will not correctly prompt a "Server Error" page.




MVC Pull frameworks like WebWork2 remove these problems all together. The work is done upfront before streaming back to the client. Combined with a better templating system like Velocity, where you have the data fed into the template, and you've got a smoking setup that doesn't have all the ugly problems of JSP.


Granted, you can go overboard and place excessive amounts of information on the context for the templates to use, but it is impossible for the template to overstep it's bounds and do work on it's own. People preach MVC using JSP, but I don't believe it to be the right choice to use JSP as the view when it has all the power to be all three.

