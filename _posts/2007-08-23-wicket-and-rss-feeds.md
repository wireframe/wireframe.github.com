---
layout: post
title: "Wicket and RSS Feeds"
date: 2007-08-23
comments: false
categories:
 - java
 - wicket
---

I love Wicket, and I love RSS so it's only logical that I'd find a way to serve up RSS within Wicket.  There's an [example RssPage posted on the Wicket wiki](http://cwiki.apache.org/WICKET/rss-page.html), and I posted a [simple RSS solution](http://www.jroller.com/wireframe/entry/wicket_feedpage) a while back, but neither of these are really solid solutions.  For the past few weeks I've been working heavily with serving RSS feeds, and I've finally gotten to a point where I can provide something back to the Wicket community.



Introducing, the new and improved Wicket FeedPage.  It's actually the same API as my previous solution, but the inner workings are much improved.  To create an RSS feed, just create a subclass of FeedPage and follow the [ROME API](https://rome.dev.java.net/) to create a SyndFeed for your RSS (or Atom) content.



```java
public class ItemFeedPage extends FeedPage {
 protected SyndFeed getFeed() {
   SyndFeed feed = new SyndFeedImpl();
   feed.setFeedType("rss_2.0");
   feed.setTitle("Sample Feed");
   feed.setLink("http://mysite.com");
   feed.setDescription("Sample Feed for how cool Wicket is");

   List entries = new ArrayList();
   SyndEntry entry = new SyndEntryImpl();
   entry.setTitle("Article One");
   entry.setLink("http://mysite.com/article/one");
   entry.setPublishedDate(new Date());

   SyndContent description = new SyndContentImpl();
   description.setType("text/plain");
   description.setValue("Article descriping how cool wicket is.");
   entry.setDescription(description);

   entries.add(entry);
   feed.setEntries(entries);
   return feed;
 }
}
```



The ROME library has really impressed me and does an excellent job of hiding the internals of creating these feeds.  Want to change from RSS to Atom?  Simple!  Just change this line:


```java
feed.setFeedType("rss_2.0");
```


to this

```java
feed.setFeedType("atom_0.3");
```



As Borat would say..."Very Nice!"



I've created a [new Wicket Stuff project](https://wicket-stuff.svn.sourceforge.net/svnroot/wicket-stuff/trunk/wicketstuff-rome/) to host this project which should make it super easy to get up and going.  Just add this block to your pom.xml file:


```xml
&lt;repositories&gt;
  &lt;repository&gt;
    &lt;id&gt;wicket-stuff-repository&lt;/id&gt;
    &lt;name&gt;Wicket-Stuff Repository&lt;/name&gt;
    &lt;url&gt;http://www.wicketstuff.org/maven/repository/&lt;/url&gt;
  &lt;/repository&gt;
&lt;/repositories&gt;

&lt;dependencies&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.wicketstuff&lt;/groupId&gt;
    &lt;artifactId&gt;wicketstuff-rome&lt;/artifactId&gt;
    &lt;version&gt;1.3-SNAPSHOT&lt;/version&gt;
  &lt;/dependency&gt;
&lt;/dependencies&gt;
```



As a side note, if you're having difficulty creating a dynamic url for use in your feed (guid, return url, etc) vote for [this Wicket issue](https://issues.apache.org/jira/browse/WICKET-609) to help create a new API for that info.

