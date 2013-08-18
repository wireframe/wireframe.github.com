---
layout: post
title: "Ruby Syntax For Java Maps"
date: 2006-06-06
comments: false
categories:
 - ruby
 - java
---

Ruby's got a lot of momentum going for it right now. One of the syntax sugars that has gotten a lot of attention is for [creation of maps](http://www.ruby-doc.org/docs/ruby-doc-bundle/Manual/man-1.4/syntax.html#hash). Compare the typical Java code to create a map with the Ruby equivilent, and you'll see why it's getting so much attention.

```java
// Java implementation
Map options = new HashMap();
options.put("foo", "bar");
options.put("option", "value");
options.put("flag", "true");
```

```ruby
# Ruby implementation
{"foo"=>"bar", "option"=>"value", "flag"=>"true"}
```

This ease of use has led to the creation of several Ruby API's that take a map as a parameter. Javascript developers have been doing this for quite some time, and [scriptaculous](http://script.aculo.us/) is an excellent example of how to use a map parameter effecively to pass optional information.

Ruby and Javascript have essentially taken maps and used them as named parameters, which has led to many Java developers clammering for [first class named parameter support in Java](http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=4124331). It isn't necessary to "fix" Java to support this feature, because this can be accomplished already with no JVM changes. To put it bluntly, Java has the ability to make maps more usable, it's just a bit different than Ruby.

This slick little example is just leveraging a little known Java feature called an initializing block. Basically, it's creating a subclass of the desired map implementation, and initializing the map upon construction. This code will work for any kind of map.


```java
Map options = new HashMap() { {
  put("key", "value");
  put("option", "foo");
  put("flag", "bar");
} };
```

Another way to accomplish this would be to create a utility implementation that takes a multi-dimensional array as a constructor argument. The downfall of this implementation is that you can't swap out implementations as easily. This would be an issue if you're using something like the [commons-collections](http://jakarta.apache.org/commons/collections) map implementations.

```java
Map options = new SimpleHashMap(new Object[][] {
  {"key", "value"},
  {"option", "foo"},
  {"flag", "bar"}
});

//simple implementation of the helper class
public class SimpleHashMap extends HashMap {
  public SimpleHashMap(Object[][] options) {
    for (int x = 0; x < options.length; x++) {
      Object key = options[x][0];
      Object value = options[x][1];
      put(key, value);
    }
  }
}
```

Maybe the Ruby syntax sugar would be nice for Java, but it certainly is not necessary. As a side note, it's essential that developers take extreme care when developing API's that use map parameters. An API needs to have [clear expectations]({% post_url 2006-03-30-clear-api %}) for what it needs to perform it's work. The concept of passing a map to a method only makes sense when the map contains optional flags. It's all about sensible defaults, and the successful Javascript and Ruby API's have got that down. If a method takes a map of options, it better work just fine with an empty map!