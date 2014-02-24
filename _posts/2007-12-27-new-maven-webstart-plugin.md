---
layout: post
title: "New Maven Webstart Plugin"
date: 2007-12-27
comments: false
tags:
 - swing
 - maven
---

After [uncovering the horrible state of affairs for Java Webstart developers]({% post_url 2007-12-26-shard-cyclops-demo-available %}), I spent some time trying to figure out where to go next. The current [codehaus plugin for webstart projects](http://mojo.codehaus.org/webstart-maven-plugin-parent/webstart-maven-plugin/) just doesn't cut it.



I was appalled that the default behavior of the plugin forced developers to manually create a JNLP file and all the plugin did was sign jar files and zip up the contents for you. After a few long discussions with the developers of the plugin, [I commented that](http://jira.codehaus.org/browse/MWEBSTART-86) "It would greatly improve the adoption of this plugin if it supports very simple out of the box behavior".



The response I was a bit surprising, "Not sure if that will improve the adoption of the plugin (what are the alternatives?)"



This got me thinking...What are the alternatives? This is exactly what's going wrong with the maven community. There are no alternatives!



I spent the next two days hacking away at the current crappy maven plugin trying to contribute back improvements before thinking to myself, should it really be this hard? Can't we provide drop dead simple support for 90% of webstart projects without jumping through all of these hoops? The current plugin is a mis-mash of partially implemented features and no clear usecase for how/when it should be used. The code is nearly unreadable and 100% untestable. Yuk...



So, I took a couple hours and whipped together a new maven webstart plugin that blows the pants off the current plugin. It handles the simple usecase with utmost ease and does so with less code and complexity. Less than 300 lines of code!



If you need complete flexability and control, use the codehaus plugin. If you want your project to "just work", use mine. =)



The simple usecase is (you guessed it), very simple:


```xml
&lt;build&gt;
  &lt;plugins&gt;
    &lt;plugin&gt;
      &lt;groupId&gt;com.codecrate&lt;/groupId&gt;
      &lt;artifactId&gt;webstart-maven-plugin&lt;/artifactId&gt;
      &lt;executions&gt;
        &lt;execution&gt;
          &lt;phase&gt;package&lt;/phase&gt;
          &lt;goals&gt;
            &lt;goal&gt;generate-jnlp&lt;/goal&gt;
           &lt;/goals&gt;
        &lt;/execution&gt;
      &lt;/executions&gt;
      &lt;configuration&gt;
        &lt;mainClass&gt;com.mysite.MyApp&lt;/mainClass&gt;
        &lt;allPermissions&gt;false&lt;/allPermissions&gt;
      &lt;/configuration&gt;
    &lt;/plugin&gt;
  &lt;/plugins&gt;
&lt;/build&gt;
```



Now, if your application needs allPermissions, you just need to add information about what keystore to use for signing your jars. I'd recommend checking out the [maven keytools plugin](http://mojo.codehaus.org/keytool-maven-plugin/) as well for helping setup and maintain your keystore.


```xml
&lt;plugin&gt;
  &lt;groupId&gt;com.codecrate&lt;/groupId&gt;
  &lt;artifactId&gt;webstart-maven-plugin&lt;/artifactId&gt;
  &lt;executions&gt;
    &lt;execution&gt;
      &lt;phase&gt;package&lt;/phase&gt;
      &lt;goals&gt;
        &lt;goal&gt;generate-jnlp&lt;/goal&gt;
       &lt;/goals&gt;
    &lt;/execution&gt;
  &lt;/executions&gt;
  &lt;configuration&gt;
    &lt;mainClass&gt;com.mysite.MyApp&lt;/mainClass&gt;

    &lt;keystore&gt;${project.basedir}/src/main/webstart/keystore&lt;/keystore&gt;
    &lt;keypass&gt;shard-rox&lt;/keypass&gt;
    &lt;storepass&gt;shard-rox&lt;/storepass&gt;
    &lt;alias&gt;shard&lt;/alias&gt;
  &lt;/configuration&gt;
&lt;/plugin&gt;
```



Pretty much every part of the JNLP file is customizable through this plugin, but the key is that there are sensible defaults so you shouldn't need to tweak anything else. But if you need to, here are some of the available switches:


<table>

<tr>

<th>Parameter</th>

<th>Description</th>

<th>Default Value</th>

</tr>

<tr>

<td>title</td>

<td>Name of application</td>

<td>project.name</td>

</tr>

<tr>

<td>description</td>

<td>Description displayed when launching application</td>

<td>project.description</td>

</tr>

<tr>

<td>homepage</td>

<td>URL for the project homepage</td>

<td>project.url</td>

</tr>

<tr>

<td>vendor</td>

<td>Company publishing the application</td>

<td>project.organization.name</td>

</tr>

<tr>

<td>codebase</td>

<td>Base URL for JNLP resources</td>

<td>project.url</td>

</tr>

<tr>

<td>jnlpFile</td>

<td>Filename of the generated JNLP file</td>

<td>launch.jnlp</td>

</tr>

<tr>

<td>spec</td>

<td>JNLP spec version</td>

<td>1.0+</td>

</tr>

<tr>

<td>offlineAllowed</td>

<td>Configure whether the application can be run offline</td>

<td>false</td>

</tr>

<tr>

<td>j2seVersion</td>

<td>Version of Java required to run the application</td>

<td>1.5+</td>

</tr>

</table>


You'll also need to add the codecrate repository to have access to the plugin:


```xml
&lt;repositories&gt;
  &lt;repository&gt;
    &lt;id&gt;codecrate-repository&lt;/id&gt;
    &lt;name&gt;Codecrate Repository&lt;/name&gt;
    &lt;url&gt;http://maven.codecrate.com/&lt;/url&gt;
  &lt;/repository&gt;
&lt;/repositories&gt;
```
