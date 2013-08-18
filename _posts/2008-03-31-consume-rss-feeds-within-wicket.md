---
layout: post
title: "Consume RSS Feeds Within Wicket"
date: 2008-03-31
comments: false
categories:
 - java
 - wicket
---

In the past, I've shown how easy it is to [publish RSS/atom feeds within Wicket applications]({% post_url 2007-09-12-wicket-feedresource %}), and now it is just as easy to consume external feeds. It's actually quite trivial (about 20 lines of code), but it is nice to support this out of the box so new users don't have to roll their own implementation every time.



The most common usecase thus far has been to display a list of information that comes from an external rss feed.



Here's an example Wicket HTML template that just displays the RSS entry's title.


```html
&lt;ul&gt;
  &lt;li wicket:id="entry"&gt;&lt;span wicket:id="title"&gt;My Happy Blog Post&lt;/span&gt;&lt;/li&gt;
&lt;/ul&gt;
```

The Java code to look up the RSS feed, and wrap it into a Wicket ListView, is ridiculously simple. The new wicketstuff-rome SyndEntryListModel does all of the heavy lifting. Just point it at the desired RSS feed and extract whatever information out of the ROME SyndEntry that you want!

```java
public class HomePage extends WebPage {
 public HomePage() {
   add(new ListView("entry", new SyndEntryListModel("http://feeds.feedburner.com/code_poet")) {
     @Override
     protected void populateItem(ListItem item) {
       SyndEntry entry = (SyndEntry) item.getModelObject();
       item.add(new Label("title", entry.getTitle()));
     }
   });
 }
}
```



I'm sure there are improvements that can be made, and I'd love to hear feedback from Wicket users what other options would be useful. Try it today and let me know what can be done to improve it!

