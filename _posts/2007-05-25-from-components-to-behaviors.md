---

title: "From Components To Behaviors"
date: 2007-05-25
comments: false
tags:
 - java
 - wicket
---

In my opinion, there are three very key concepts to Wicket's architecture. Luckily, these concepts are easy enough to grasp to get up and running quickly, but they also have a lot of depth if you want to dig in to them. The high level concepts are:



  1. Components - Very similar to Swing Components. Could refer to them as Widgets.


  2. Models - Encapsulates how Components retrieve and save data.


  3. Behaviors - Used to enhancea Component with new functionality.





I've been working with Wicket for quite a while now, and I think I finally understand the power of Behaviors. It's kind of like The Matrix, when Neo finally can see through the code.



You'll notice that the new version of wicketstuff-scriptaculous has dropped Autocompletion Components in favor of Behaviors. Compare the old solution to the new code. Using the old component looked like this:


```java
AutocompleteTextField color = new AutocompleteTextField ("color", new String[] {"red", "green", "blue"});
```



And the new implementation looks like this:


```java
TextField color = new TextField("color");
color.add(new AutocompleteBehavior(new String[] {"red", "green", "blue"}));
```



Why is this such a big deal?



For starters, you are no longer coupled to a particularTextField implementation. This is great for when people create their own subclasses of Components to customize behavior. For example, I might create a simple RequiredTextField Component. Using Behaviors allows you to use this functionality on anyTextField Component! Using Components forces users to use class extension to customize behavior while using Behaviors allows for a mix-and-match approach more like interfaces.



Building Components is also tricky because most Wicket Components have several constructors. For example, the Wicket Image Component has 3 unique constructors. So, if you're going to build a custom Image Component, you need to support all of the various ways to construct the parent Image Component. On the other hand, Behaviors don't care how the Component was constructed. It's job is to just add some additional functionality to the Component it's attached to.



And that, my friends, is why Wicket Behaviors kick serious ass.

