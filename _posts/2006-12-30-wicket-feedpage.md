---
layout: post
title: "Wicket FeedPage"
date: 2006-12-30
comments: false
tags:
 - java
 - wicket
---

Merry Christmas and a Happy New Year to all you folks out there. Here's a belated Christmas gift for all you Wicket developers out there.



I've been adding RSS feeds to my Wicket application based on the example [Wicket RssPage found on the wiki](http://cwiki.apache.org/WICKET/rss-page.html), and thought it was very restrictive in what it could do. There are a ton of Java libraries out there to build rss feeds, and this RssPage was yet another solution.



I wanted to leverage other libraries and avoid duplicating all of that markup in my own component, so I built a new FeedPage that uses the [Rome Java library](https://rome.dev.java.net/) to take care of all the details. Now I can handle any format of RSS or Atom, along with several media extensions without changing any markup files.



```java
public abstract class FeedPage extends WebPage {
 @Override
 public String getMarkupType() {
   return "xml";
 }

 @Override
 protected final void onRender(MarkupStream markupStream) {
   PrintWriter writer = new PrintWriter(getResponse().getOutputStream());
   SyndFeedOutput output = new SyndFeedOutput();
   try {
     output.output(getFeed(), writer);
   } catch (IOException e) {
     throw new RuntimeException("Error streaming feed.", e);
   } catch (FeedException e) {
     throw new RuntimeException("Error streaming feed.", e);
   }
 }

 protected abstract SyndFeed getFeed();
}

```



Wicket requires a markup file for each page, so you'll need to create an empty FeedPage.xml file to go along with this page.



Now you can create your own page and get RSS or Atom feeds in Wicket! This is a quick example of how to do it, and you'll probably want to take a look at the [Rome tutorials for how to get more advanced stuff](http://wiki.java.net/bin/view/Javawsxml/Rome05Tutorials).



```java
public class ItemFeedPage extends FeedPage {
 protected SyndFeed getFeed() {
   SyndFeed feed = new SyndFeedImpl();
   feed.setFeedType("rss_2.0");
   feed.setTitle("Sample Feed");
   feed.setLink("http://mysite.com");

   feed.setDescription("Sample Feed for how cool Wicket is");

   List entries = new ArrayList();
   SyndEntry entry;
   SyndContent description;

   entry = new SyndEntryImpl();
   entry.setTitle("Article One");
   entry.setLink("http://mysite.com/article/one");
   entry.setPublishedDate(new Date());
   description = new SyndContentImpl();
   description.setType("text/plain");
   description.setValue("Article descriping how cool wicket is.");
   entry.setDescription(description);
   entries.add(entry);

   feed.setEntries(entries);

   return feed;
 }
}
```



Enjoy your gift everyone! =)
