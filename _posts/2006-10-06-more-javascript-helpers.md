---
layout: post
title: "More Javascript Helpers"
date: 2006-10-06
comments: false
categories:
 - javascript
 - java
---
With all of the Javascript needed to work with AJAX, it gets messy pretty quickly when you're building Javascript programatically within Java.  Especially when you need to pass optional parameters as a Javascript hash to a library.  If Java had something like [Ruby's RJS](http://nubyonrails.com/articles/2006/02/01/rjs-and-content-type-header), that would get rid of this mess.  Until that comes around, I've enhanced my `[JavascriptBuilder](http://jroller.com/page/wireframe?entry=javascriptbuilder)` to make my life a little easier with dealing with more complex Javascript API's.

Need to pass a hash of options to a Javascript method?  Now, you can just create a Java map of options (`Boolean`, `String`, or `JavascriptFunction` references), and it'll automatically be formatted into the correct javascript syntax!  Here's an example...

<pre>
Map dropOptions = new HashMap() {{
  put("accept", draggableClass);
  put("onDrop", new JavascriptFunction("function(element) {new Ajax.Updater('" + getId() + "', '"+ url+ "')}"));
  put("hoverclass", getId() + "-active");
  put("revert", Boolean.TRUE);
}};

JavascriptBuilder builder = new JavascriptBuilder();
builder.addLine("Droppables.add('" + getId() + "', ");
builder.addOptions(dropOptions);
builder.addLine(");");

System.out.println(builder.buildScriptTag());
</pre>

Notice the [abbreviated syntax for working with simple maps](http://jroller.com/page/wireframe/?anchor=ruby_syntax_for_java_maps)?  =)