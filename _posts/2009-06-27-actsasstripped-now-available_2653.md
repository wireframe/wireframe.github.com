---
layout: post
title: "acts_as_stripped Now Available"
date: 2009-06-27
comments: false
tags:
 - ruby
 - rails
---

In my experience, it's very common for web frameworks to automatically strip extra whitespace from posted forms.  Wicket, for example just does the "right thing" by default, and it genuinely surprised me when I found out that Ruby on Rails does not do this by default.


Rails is a wonderfully pluggable framework, and so I've published a Ruby gem which will strip out extra whitespace for any string attributes.  It's called acts\_as\_stripped and can be found on github at [http://github.com/wireframe/acts\_as\_stripped/](http://github.com/wireframe/acts_as_stripped/).  The Rails community is all about sexy project names, but I just couldn't make myself name this little plugin "stripper".  :)


Usage of this plugin is incredibly simple:


# strip whitespace from *all* string attributes

class User   acts\_as\_stripped

end


# strip whitespace from *select* string attributes

class Post   acts\_as\_stripped :title, :summary

end

Drop me a line if there are any questions or suggestions.  The nice benefit of using this plugin is that it works with any ActiveRecord model object and is not directly tied to the Rails web framework. 

This plugin was inspired by this post: [http://granth.ca/2006/02/strip-whitespace](http://granth.ca/2006/02/strip-whitespace)



