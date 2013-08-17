---
layout: post
title: "No Save For You!"
date: 2006-07-20
comments: false
categories:
 - wtf
---

I love how naive some software developers are. For some reason people just don't realize that littering your view layer with business logic is a bad idea. Here's an example. I just stumbled across a web application that has the amazing security feature to prevent user's from submitting a page if they don't have permission. Now, how do you suppose they implemented that?



```html
&lt;!-- only display save button if user has permission --&gt;
&lt;c:if test="${userHasPermission}"&gt;
  &lt;input type="submit" name="submit" value="submit" /&gt;
&lt;/c:if&gt;
```



There's nothing inherintly wrong with this solution, except for the fact that this is the **only** place security is enforced in the application.



Thank God for tools like [greasemonkey](http://greasemonkey.mozdev.org/) and [firebug ](https://addons.mozilla.org/firefox/1843/)that allow you to execute scripts against the available DOM. Something like this works like a champ to get around that _pesky_ security.


```javascript
document.forms[0].submit();

```
