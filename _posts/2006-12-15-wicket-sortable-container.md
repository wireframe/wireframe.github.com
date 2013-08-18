---
layout: post
title: "Wicket Sortable Container"
date: 2006-12-15
comments: false
categories:
 - javascript
 - java
 - wicket
 - ajax
---

The Wicket [ListView](http://wicket.sourceforge.net/apidocs/wicket/markup/html/list/ListView.html) is an excellent core component when you need to display a list of objects. It's fairly simple to use and is fairly extensible when you need to customize it's behavior.



The Java code for using a ListView is fairly simple. Note: This is using the most recent Wicket-2.0 snapshot API, which is slightly different from the Wicket 1.0 API.


```java
add(new ListView("rows", listData) {
 public void populateItem(final ListItem item) {
   MyObject bean = (MyObject) item.getModelObject();
   new Label(item, "label", bean.getLabel());
 }
});

```



The HTML template to use the ListView is pretty straightforward too.


```html
&lt;ul&gt;
  &lt;li wicket:id="items"&gt;
    &lt;span wicket:id="label"&gt;Something unique for this object&lt;/span&gt;
  &lt;/li&gt;
&lt;/ul&gt;
```


This is all fine and dandy, but it's pretty bare bones. Now, if you want to do some fancy Web 2.0ish drag/drop reordering of your items, check out the new SortableContainer Wicket extension that integrates the [very sweet scriptaculous Sortable Javascript component](http://wiki.script.aculo.us/scriptaculous/show/Sortable.create) and does all the hard work for you.



The Java code is just slightly different from the ListView. You must pass in a wicketId for the list container (ul, ol, table, etc) as well as the wicketId for the individual list item (li, tr, etc).


```java
new SortableContainer(this, "itemList", "item", listData) {
 public void populateItemInternal(final ListItem item) {
   MyObject bean = (MyObject) item.getModelObject();
   new Label(item, "label", bean.getLabel());
 }
};

```



The HTML template is nearly identical too. You just need to add a wicketId to the parent container.


```html
&lt;ul wicket:id="itemList"&gt;
  &lt;li wicket:id="item"&gt;
    &lt;span wicket:id="label"&gt;Something unique for this object&lt;/span&gt;
  &lt;/li&gt;
&lt;/ul&gt;
```

Simple enough for ya? I was extremely excited to see [developers having success getting up and running with the latest snapshot release of these components]({% post_url 2006-12-10-wicket-scriptaculous-snapshot-release %}). I'd love to hear other success (or horror) stories from anyone out there that's using these components!



As a side note, I've been reading some posts that the Wicket Repeater API is more robust than the ListView, but without knowing the details, I'll stick with the ListView for now.
