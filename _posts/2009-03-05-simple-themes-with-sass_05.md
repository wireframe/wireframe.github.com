---
layout: post
title: "Simple Themes With SASS"
date: 2009-03-05
comments: false
categories:
 - css
---

[SASS](http://haml.hamptoncatlin.com/docs/rdoc/classes/Sass.html) is an amazing library to have in your toolbox.  Here's a simple trick to make skinning your website drop dead easy...AND MAINTAINABLE!!



Let's start with a simple HAML page that includes a specific stylesheet depending on the user's current theme.



index.html.haml


```haml
%html
  %head
    //dynamically write in whichever theme the user has configured
    = stylesheet_link_tag 'theme_default.css'
  %body
    hello world
    %p.fancy_text
      SASS is the bomb
```

Now, let's create the SASS file for the specific theme. We'll define all of our themeable properties as SASS variables, which will be used later on.

theme\_default.sass
```sass
!textcolor = red
@import themable.sass
```



Can't get much simpler than that! Now, we'll define all of our themed elements and reference the variables declared in the specific theme file.


themable.sass
```sass
.fancy_text
  :color= !textcolor
```

That's it!  Now, anytime you want to create a new theme, simply create a new SASS file, declare your variables, and import the common include file! Here's a quick example...



theme\_blue.sass


```sass
!textcolor = blue
@import themable.sass
```
