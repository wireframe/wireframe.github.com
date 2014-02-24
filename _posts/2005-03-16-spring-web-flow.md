---
layout: post
title: "Spring Web Flow"
date: 2005-03-16
comments: false
tags:
 - java
 - spring
---

It looks like there's yet another web framework to check out. The [Spring Web Flow](http://opensource.atlassian.com/confluence/spring/display/WEBFLOW/Home) framework appears to have taken a very similar approach to actions and their results as [WebWork2](http://www.opensymphony.com/webwork), yet I hope that this new project will prove to be more useful than the over engineered, hyper flexible Spring MVC framework. From my experience, these command pattern frameworks are by far the best development strategy for web applications, and should be a welcome addition to the Spring library. Hopefully it will replace the existing MVC framework altogether, since it certainly won't be difficult to be better than what's currently offered.


After [a bit of reading](http://opensource.atlassian.com/confluence/spring/display/WEBFLOW/Practical+Guide) I really like how the framework can be configured programatically and doesn't mandate the use of XML, which is a welcome change from the fighting I've done with the internals of the WebWork2 and XWork. You know, Spring definately has an edge in framework elegance, and making things as simple as possible. That being said, WebWork2 and XWork do an excellent job of abstracting away the internals of dealing with the HTTP environment. [SwingWork](http://swingwork.codecrate.com) is proof that the command pattern framework makes sense for client side development as well. Heck, I can even reuse my "web" actions, on the client side, with no code changes. This is not possible with the current Spring Web Flow API since it is heavily tied to the servlet container.


So, maybe [my previous post]({% post_url 2005-01-13-webwork-over-spring-mvc %}) about using WebWork2 as an action processing framework ontop of Spring may not be needed after all. I know it's possible to "trick" WebWork2 into using Spring, but I don't find that to be the correct solution to the problem. I'm sure that Spring Web Flow will be much less hassle and be better supported.


Competition in this web action processing framework area is good, and I hope that the emergance of the Spring Web Flow project will push other projects to improve and inovate. WebWork2 definitely has a huge head start over this new project, but I think that both projects could improve in a lot of ways.

