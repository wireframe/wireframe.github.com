---
layout: post
title: "Webstart Report Now Available"
date: 2008-01-01
comments: false
categories:
 - java
 - webstart
 - swing
---

Happy New Year everyone!



The last day of 2007 brought a few new changes for the codecrate webstart maven plugin. I was extremely bored last night watching the Dick Clark New Years Bash and decided that my first resolution of the new year was to do something productive. What a way to bring in the new year!




  - The plugin is now packaged under the com.codecrate.webstart group id. This is more consistent with the other projects and plugins I've published.


  - No more keystore configuration is necessary! The plugin will automatically generate a new keystore using the organization information from the POM to sign your jar files for you.


  - The plugin can now generate an HTML report for your maven site. You can still link directly to the JNLP file, but the report will auto detect if the user has Java installed and provide info on installing Java before launching the application. This should help new users avoid getting an ugly XML file if they don't have Java installed.





To add the webstart report to your maven site, just add this block of xml to your POM file.


```xml
&lt;reporting&gt;
  &lt;plugins&gt;
    &lt;plugin&gt;
      &lt;groupId&gt;com.codecrate.webstart&lt;/groupId&gt;
      &lt;artifactId&gt;webstart-maven-plugin&lt;/artifactId&gt;
    &lt;/plugin&gt;
  &lt;/plugins&gt;
&lt;/reporting&gt;
```



An [example of the new report can be seen with the shard-cyclops project](http://shard.codecrate.com/shard-cyclops/launch.html).



