---
layout: post
title: "Autocomplete More Than Just Text"
date: 2005-08-25
comments: false
categories:
 - javascript
 - java
 - scriptaculous
 - wicket
 - ajax
---

If you run the [scriptaculous autocomplete demo](http://script.aculo.us/demos/ajax/autocompleter_customized) you'll notice that one of the coolest features is that the results are not just plain text. They display a thumbnail image along with two pieces of text in a great looking layout. You might not realize it, but the current Wicket AutocompleteTextField in wicket-stuff already supports this behavior.



Now, you might be thinking, "That's crazy? How can this be when the API only returns a String?"


```java
protected abstract String[] getResults(String input);
```



Well, why not just return an HTML formatted string? Here's some example code:


```java
public AdvancedAutocompleteExampleForm(String id) {
    super(id);
    add(new AutocompleteTextField("emailAddress") {
        public String[] getResults(String input) {
      return new String[] {
          buildAutoCompleteContent("bill.gif", "Bill Gates", "bill.gates@microsoft.com")
    , buildAutoCompleteContent("ryan.gif", "Ryan Sonnek", "ryansonnek@notvalid.com")
            };
        }
    });
}

private String buildAutoCompleteContent(String image, String name, String emailAddress) {
  StringBuffer content = new StringBuffer();
  content.append("&lt;div class=\"imageContent\"&gt;");
  content.append("&lt;img src=\"" + image + "\" alt=\"" + name + "\"/&gt;");
  content.append("&lt;/div&gt;");
  content.append("&lt;div class=\"nameContent\"&gt;");
  content.append(name);
  content.append("&lt;/div&gt;");
  content.append("&lt;div class=\"informal\"&gt;");
  content.append(emailAddress);
  content.append("&lt;/div&gt;");

  return content.toString();
}
```

Yep, that's it.  Now in order for it to look good, you'll have to attach some custom style sheet similar to scriptaculous.

```java
public final void printHeadInitContribution(HtmlHeaderContainer container) {
  container.getResponse().write(
      "&lt;style type=\"text/css\"&gt;\n" +
      " li.contact div.imageContent {\n" +
      "   float:left;\n" +
      "   width:32px;\n" +
      "   height:32px;\n" +
      "   margin-right:8px;\n" +
      " }\n" +
      " li.contact div.nameContent {\n" +
      "   font-weight:bold;\n" +
      "   font-size:12px;\n" +
      "   line-height:1.2em;\n" +
      " }\n" +
      " li.contact div.informal {\n" +
      "   font-size:10px;\n" +
      "   color:#888;\n" +
      " }\n" +
        "&lt;/style&gt;\n");
}
```

Now for a bit more of scriptalicious magic. You might be wondering how the autocomplete text box figures out what text to use when a user selects the text from the drop down. After all, there are two separate text chunks to choose from. This is where the informal class name comes into play. When the user selects an auto complete entry, all informal chunks are ignored. This means that there should only be one piece of text content that is not informal.



I have committed this [example example into wicket-stuff](http://cvs.sourceforge.net/viewcvs.py/wicket-stuff/wicket-contrib-prototype-examples/) for anyone to use and to keep up to date with the ever changing AutocompleteTextField API.

