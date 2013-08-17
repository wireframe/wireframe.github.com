---
layout: post
title: "Simple CSS Builder"
date: 2006-05-15
comments: false
categories:
 - java
 - css
---

I would like to think that most developers can avoid hardcoding web content (html, javascript or CSS) directly in Java code. Realistically though, there are times when it's just easier to put it in the code. [Wicket](http://wicketframework.org) is definately improving this, but I'm sure there will still be times where this web content get's hardcoded in Java.



In order to try and ease any future pain I have with generating CSS within Java, I finally broke down and wrote a simple CSS utility class. **Disclaimer:** This utility was built using 100% Test Driven Development. =)



```java
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class CssBuilder {
    private Collection selectors = new ArrayList();

    public CssSelector startSelector(String selector) {
        CssSelector newSelector = new CssSelector(selector);
        selectors.add(newSelector);
        return newSelector;
    }

    public String toString() {
        return printStyle();
    }

    public String printStyle() {
        StringBuffer output = new StringBuffer();
        for (Iterator iter = selectors.iterator(); iter.hasNext();) {
            CssSelector selector = (CssSelector) iter.next();
            output.append(selector.printStyle());
        }
        return output.toString();
    }

    public static class CssSelector {
        private final String selector;
        private final Map properties = new HashMap();

        CssSelector(String selector) {
            this.selector = selector;
        }

        public String toString() {
            return printStyle();
        }
        public CssSelector addProperty(String property, String value) {
            properties.put(property, value);
            return this;
        }

        String printStyle() {
            StringBuffer output = new StringBuffer();
            output.append(selector).append(" {\n");

            for (Iterator iter = properties.keySet().iterator(); iter.hasNext();) {
                String property = (String) iter.next();
                String value = (String) properties.get(property);
                output.append("  ").append(property).append(": ");
                output.append(value).append(";\n");
            }

            output.append("}\n");
            return output.toString();
        }
    }
}

```



I've tried to follow Domain Driven Design principles, even for this simple class. It was important to try and use the correct language when designing this API. Notice the use of properties instead of attributes. Selector is a term that I'm not too familiar with, but [it is correct term](http://www.w3.org/TR/REC-CSS2/selector.html), and is definately more descriptive than my second runner up, Element.



This is my first excursion into using method chaining. I used to loathe method chaining, but I've come to realize that it has it's place. It's pretty slick to see code this simple:


```java
public String buildCss() {
  CssBuilder builder = new CssBuilder();
  builder.startSelector(".style")
   .addProperty("display", "none")
   .addProperty("padding-left", "0");
  return builder.printStyle();
}
```
