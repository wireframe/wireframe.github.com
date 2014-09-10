---

title: "Fork it up - acts_as_state_machine"
date: 2008-11-04
comments: false
tags:
 - ruby
 - opensource
---

Consider the following class definition:


```ruby
class Door
 acts_as_state_machine :initial => :open
 state :closed
 state :open
 event :lock do
   transitions :from => :open, :to => closed
 end

 event :unlock do
   transitions :from => :closed, :to => open
 end
end
```


Now, what is wrong with this script?

```ruby
door = Door.new
door.lock! #=> closes the door
door.lock! #=> doesn't do anything. door is already closed
```

The script **_should_** produce an error because the _lock_event does not have a valid transition when the door is already in the _closed_state. Instead, the current _acts\_as\_state\_machine_plugin quietly returns _false_if
there is no valid transition. That definitely isn't what I expected
and seriously took me several hours to track down this mysterious
behavior.

I have published [a fork of the _acts\_as\_state\_machine_project](http://github.com/wireframe/acts_as_state_machine/tree/master) which _**correctly**_ raises exceptions if there are no valid transitions available. The code change is very minor if you want to apply a patch to your own install.

There's an entire rant just ripe for the picking, but I'll save that for
another time. For now, I've "scratched my own itch" and have made a
library work much more intuitively for me. I'm happy... =)
