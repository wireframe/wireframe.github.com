---
layout: post
title: "Wicket FeedResource"
date: 2007-09-12
comments: false
tags:
 - java
 - wicket
---

Just when I think I'm a Wicket guru, I discover a new layer to this pretty amazing framework.



One of [my previous posts]({% post_url 2007-05-25-from-components-to-behaviors %}), I mentioned that the three key concepts for working with Wicket were Components, Models, and Behaviors.  Well, it looks like I'm going to add Resources to that list as well.  I started uncovering the Wicket Resource after finishing up my [Wicket FeedPage contribution]({% post_url 2007-08-23-wicket-and-rss-feeds %}).  I got some excellent feedback and was advised [to use a Resource instead of a WebPage]({% post_url 2006-12-30-wicket-feedpage %}).



What's the difference between a Resource and a WebPage?  They both can serve HTML/XML content, but a Resourcealso allows for serving up of arbitrary content (like download files). Resources are more like lightweight version of WebPages that are not versioned and do not allow Components to be embedded into them.  It definitely makes sense to me that a Feed would be considered a Resource for a WebPage instead of a standalone entity.



The API for creating a FeedResource is very similar to creating the FeedPage:


```java
public class MyFeedResource extends FeedResource {
 protected SyndFeed getFeed() {
   //construct and return the feed as usual
 }
}

```



Where things start to get interesting is when you want to reference this FeedResource from within your application.  You can't construct a link to a Resource in the same way as to a WebPage, you'll need to create a ResourceReference to indirectly talk to the Resource instead. ResourceReferences are pretty cryptic, but I've had some pointers from the Wicket Developers, so hopefully I'm on the right track.



Constructing a URL to the FeedResource is particularly important if you want browser's to automatically detect your feed and display their fancy RSS icon. The simplest way to construct this autodiscovery link the FeedResource.autodiscoveryLink() API which will automatically insert the browser autodiscovery link into the HTML head.



```java
public class MyPage extends WebPage {
 public MyPage() {
   add(FeedResource.autodiscoveryLink(new ResourceReference("myFeed") {
     protected Resource newResource() {
       return new MyFeedResource();
     }
   }));
 }
}
```



This is a pretty simple example, and there are a number of different ways to use ResourceReferences, so don't take this as the only way to create the autodiscovery link.



Download the latest version and give it a spin!  Let me know if there are any other suggestions to make this the best RSS integration for any Java web framework!

