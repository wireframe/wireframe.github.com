---
layout: post
title: "Integrate JTaskPane With Spring-RCP"
date: 2006-01-29
comments: false
categories:
 - java
 - spring
 - springrcp
---

After my [previous endevour integrating contextual tasks into shard]({% post_url 2006-01-19-contextual-tasks %}), I wanted to take a step back and see if there was room for improvement.



One glaring issue with my original implementation was that it was very "un-spring like". I built my context page by hand and I wasn't able to use the helper objects that Spring-RCP exposes to generate UI specific command objects like button groups, menu objects or popups. For example:


```java
CommandGroup group = getWindowCommandManager().getCommandGroup("popUp");
group.createPopupMenu();
```



I wanted to build my context pane in the same way so that I could add/remove actions to the context pane without changing my Java code. I also wanted to enhance spring-rcp to add a new "helper" method to build the task pane for me. Something along the lines of:


```java
CommandGroup group = getWindowCommandManager().getCommandGroup("contextTasks");
group.createTaskPane();
```



Trying to accomplish this enhancement was not nearly as easy as I expected. It was extremely difficult to inject this behavior into spring-rcp, and the implementation is not for the faint of heart. =) It's unfortunate that the behavior to generate these swing components is so coupled to the implementation. It would be better if the CommandGroup registered different handlers for what Swing components it could generate. That would allow for easier extension of what Swing components spring-rcp supported. A new API could be created that might look something like:


```java
CommandGroup group = getWindowCommandManager().getCommandGroup("contextTasks");
group.createSwingComponent(JMenuBar.class);
```



I won't go into the hairy details of how I got it all to work right now. If anyone is interested, you can checkout the code from [shard](http://shard.codecrate.com), or drop me a line and I'd be glad to go over it with you. After all of my work was done, here's all that's needed now to build a fully configurable task pane that's wired from spring-rcp!


command-context.xml

```xml
&lt;bean id="contextTasks"
    class="com.codecrate.shard.ui.command.task.TaskPaneFactoryBean"&gt;
    &lt;property name="members"&gt;
        &lt;list&gt;
            &lt;ref bean="commonTasks" /&gt;
        &lt;/list&gt;
    &lt;/property&gt;
&lt;/bean&gt;

&lt;bean id="commonTasks"
    class="com.codecrate.shard.ui.command.task.TaskPaneGroupFactoryBean"&gt;
    &lt;property name="members"&gt;
        &lt;list&gt;
            &lt;value&gt;newCommand&lt;/value&gt;
        &lt;/list&gt;
    &lt;/property&gt;
&lt;/bean&gt;
```


MyObjectView.java

```java
TaskPaneCommandGroup tasks = (TaskPaneCommandGroup) getWindowCommandManager().getCommandGroup("contextTasks");
tasks.createTaskPane();
```



I wonder if other spring-rcp users have built similar extensions? I don't think this code could be pushed into spring-rcp since they shy away from including widgets into the core framework, but maybe this code should be hosted somewhere else? Seems kindof similar to the [Spring-RCP/Flexdock integration project](https://jide-springrcp.dev.java.net/).
