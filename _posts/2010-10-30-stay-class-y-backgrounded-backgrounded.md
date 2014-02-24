---
layout: post
title: "Backgrounded Class Methods"
date: 2010-10-30
comments: false
tags:
 - ruby
 - backgrounded
---



Stay "Class-y" Backgrounded!
----------------------------


Backgrounded was originally intended to only run ActiveRecord instance methods in the background but as the library has matured, its focus has broadened into an **elegant proxy to arbitrary background processors**.


There are lots of usecases where it's necessary to run a background method on a non-ActiveRecord instance, and the latest Backgrounded release now supports running any class level method with backgrounded! All out of the box back-ends have been updated to respect this new configuration.


Backgrounded class methods work exactly the same as instance methods and there are no client API changes required to use them. Just reference your class level method with a class level backgrounded declaration and you're all set.


```
class User
 class << self
   backgrounded :my_instance_method
   def my_instance_method
   end
 end
end


#run the instance method in the background
=> User.my_instance_method_backgrounded
```


Sourcecode on Github.

[http://github.com/wireframe/backgrounded](http://github.com/wireframe/backgrounded)


Latest gem on Gemcutter.

[https://rubygems.org/gems/backgrounded](https://rubygems.org/gems/backgrounded)
