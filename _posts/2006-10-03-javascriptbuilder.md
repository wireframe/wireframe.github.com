---
layout: post
title: "JavascriptBuilder"
date: 2006-10-03
comments: false
categories:
 - javascript
 - java
---

I'm jumping back into web development after my recent stint building rich client apps. This is a helper object I've been using to programmatically build Javascript on the server side. Nothing too special, but it makes the code quite a bit cleaner than using a standard StringBuffer. Very similar to the [CssBuilder]({% post_url 2006-05-15-simple-css-builder %}) I wrote a while back.



```java
public class JavascriptBuilder {
 private StringBuffer buffer = new StringBuffer();

 public void addLine(String line) {
   buffer.append(line).append("\n");
 }


 public String buildScriptTag() {
   return "\n\n";
 }
}

```
