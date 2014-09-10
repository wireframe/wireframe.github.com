---

title: "Crazy Command Composition"
date: 2006-07-01
comments: false
tags:
 - java
 - spring
 - springrcp
---

I'll send out a bright shiny new nickel to whoever can guess what this spring xml file is actually accomplishing. :)



```xml
  &lt;bean id="importDatasetCommand" class="com.codecrate.shard.ui.command.SpecificApplicationEventActionCommandExecutor"&gt;
    &lt;constructor-arg&gt;&lt;value&gt;com.codecrate.shard.ui.command.ImportDatasetEvent&lt;/value&gt;&lt;/constructor-arg&gt;
    &lt;constructor-arg&gt;
      &lt;bean class="com.codecrate.shard.ui.command.EventDispatcherThreadActionCommandExecutor"&gt;
        &lt;constructor-arg&gt;
          &lt;bean class="com.codecrate.shard.ui.command.ApplicationWindowProgressMonitorActionCommandExecutor"&gt;
            &lt;constructor-arg&gt;
              &lt;bean class="com.codecrate.shard.ui.command.FoxtrotBackgroundJobActionCommandExecutor"&gt;
                &lt;constructor-arg&gt;
                  &lt;bean class="com.codecrate.shard.ui.command.MethodInvokingActionCommandExecutor"&gt;
                    &lt;property name="targetObject"&gt;&lt;ref bean="importDatasetService"/&gt;&lt;/property&gt;
                    &lt;property name="targetMethod"&gt;&lt;value&gt;importDataset&lt;/value&gt;&lt;/property&gt;
                  &lt;/bean&gt;
                &lt;/constructor-arg&gt;
              &lt;/bean&gt;
            &lt;/constructor-arg&gt;
          &lt;/bean&gt;
        &lt;/constructor-arg&gt;
      &lt;/bean&gt;
    &lt;/constructor-arg&gt;
  &lt;/bean&gt;
```



I absolutely love the decorator pattern. It promotes encapsulation of specific behavior into seperate classes. The problem is that when trying to compose an object with multiple layers of functionality, it can get out of control (like above). Usually, this is where a "factory" object is created to encapsulate complex object creation, but unfortunately for me, the above example can't be pushed into a factory helper. Why?



First, the SpecificApplicationEventActionCommandExecutor implements the ApplicationListener interface. Spring inspects the application context for classes that implement this functionality, which means this layer has to be defined in XML.



Next, the ApplicationWindowProgressMonitorActionCommandExecutor implements ApplicationWindowAware interface, which has the same issues as the ApplicationListener interface.



Hopefully I'll be able to encapsulate this functionality into some form of spring prototype block so that I can just inject my customized behavior into this whole stack of wrappers.
