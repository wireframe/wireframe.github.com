---

title: "IE Must DIE!"
date: 2005-07-28
comments: false
---

Why, oh why, are people still using Internet Explorer? Won't someone please think of the children! I just spent half of my day troubleshooting a problem that ended up only being reproducable on Windows XP using Internet Explorer. What sucks is that I'm still running Windows 2000, so it was not exactly trivial to figure out where the problem was.



In the end, it all comes down to the way Internet Explorer handles forms. I had a form with a submit button like so:


```html
<input class="submit" type="submit" value="save changes" onClick="javascript:submitForm();"/>
```


It may not be the best, but it's definately valid HTML. The problem is that IE see's this as a button with a type of submit. When the user clicks on the button it submits the form, and THEN runs the javascript method, which submits the form again. The end result is that very bad things were happening on our backend with the multiple requests coming in.



So, now I have updated my form to be more IE friendly like this:


```html
<a href="javascript:submitForm();">save changes</a>
```



rage....for....IE....building......

