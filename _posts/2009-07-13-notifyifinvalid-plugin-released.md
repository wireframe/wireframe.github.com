---
layout: post
title: "notify_if_invalid Plugin Released"
date: 2009-07-13
comments: false
tags:
 - ruby
---




Rails does a great job at making some of the headaches of building stateful webapps go away. In particular, form validation has always been a complex area in web frameworks, and Rails handles this beautifully. It's absolutely trivial to re-render a form and give decent feedback to the user what went wrong.

```ruby
class UsersController
 def create
   user = User.new params[:user]
   if user.save
     #looks good!
     redirect_to user_path(user)
   else
     #something is wrong, re-render the form
     render :action => :new
   end
 end
end

```


This is all well and good, but there's a slight issue with this pattern. Re-rendering the form is a great user interaction, but we've effectively hidden the fact that the user encountered an error. The fact that the user was unable to save the form is a very important fact to record. It could mean that:

  - the model object is not able to be constructed given the information on the page (ex: missing attributes)
  - the design is not intuitive and user's missed important information


Either way, it is important to record and measure these events. In my experience, it has been applicable to consider these validation errors as important as actual application errors. The fact that the user was able to construct an "invalid" object is just another opportunity for the user to drop out of your application, never to return.


I've built a plugin that will assist in recording these events in [HopToad](http://hoptoadapp.com/) (my preferred error monitoring tool). The notify\_if\_invalid plugin is a Rails plugin that will record a ValidationError in HopToad anytime a user creates an invalid ActiveRecord Model. This plugin is available on github at [http://github.com/wireframe/notify\_if\_invalid](http://github.com/wireframe/notify_if_invalid) and has a super simple API.

```ruby
class User
  notify_if_invalid
end
```


Done!


I'm open to any suggestions for naming this plugin, and I still need to convert this to a gem. I'm not a fan of Rails plugins, but they are so damn easy to create! Let me know if you see opportunities for improvement!
