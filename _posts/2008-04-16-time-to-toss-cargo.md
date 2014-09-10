---

title: "Time To Toss the Cargo"
date: 2008-04-16
comments: false
tags:
 - java
 - cargo
---

Over the past year and a half, I've been heavily involved in migrating a large size application from OC4J appserver to tomcat. At the time, it seemed both logical and relatively smart to choose [cargo](http://cargo.codehaus.org) for launching our application with a more application server neutral configuration. I now regret that I made the jump to use cargo so naively.



Let this post stand as a warning for others to avoid the same "cargo (strangle)hold".



### Limitations


There are a number of specific bells and whistles that each appserver provides that are not accessible through the cargo API. For example, it is impossible to tweak the location for tomcat's webapp/work directories. Changing the tomcat server.xml file is essentially ignored/overwritten by cargo.



This boils down to cargo implementing the lowest common denominator between implementations.



### Performance


My simple testcase shows cargo taking ~30 seconds longer to startup our application (average startup time increased from ~85 seconds to ~120 seconds). This is *strictly* startup time within the appserver and does not account for all of the extra overhead from the cargo maven plugin. We've also noticed a *significant* change in performance at runtime. Using cargo causes the application to run ~20-30% slower than normal. Wow...



I intend to dig into this a bit deeper to identify the root cause, but initial investigation shows a fair amount of overhead for how cargo redirects/forks server output to files and the console.



### codehaus (A.K.A. - The Project Graveyard)


It's common knowledge that all "good" Java projects that start codehaus migrate to a real OS community as quickly as possible *cough* wicket *cough*. =)



I'm serious here. Look at the track record that codehaus has going for it. Picocontainer, Maven Mojos, Cargo, etc. It's inevitable that there will be lots of failures for every few shining successes, but thus far codehaus has a pretty poor batting average.



### Abstractions == Complexity


Abstracting away the complexity of appservers *sounds* like a good thing, but replacing it with a new layer of complexity which is completely foreign is much worse.



Tracking down *how* cargo is doing what is doing is very difficult. It actually appears to be using JMX to inspect and modify the tomcat runtime environment after it has started up!



Seriously, I was able to write a standalone tomcat launcher maven plugin with ~20 lines of code using ant tasks. It does everything I need including configuring JVM options. I'm not sure why the cargo plugin is so damn complex and bloated?



```java
/**
 *
 * @goal startTomcat
 */
public class StartTomcatMojo extends AbstractMojo {

 /**
 * @parameter
 * @required
 */
 private File tomcatHome;

 /**
 * @parameter
 */
 private String javaOpts;

 public void execute() throws MojoExecutionException {
   getLog().info("Starting tomcat: " + tomcatHome);

   Project project = new Project();
   project.setBaseDir(tomcatHome);
   project.addBuildListener(new AntToConsoleLogger()); //redirect ant output to System.out

   Java java = new Java();
   java.setProject(project);
   java.setJar(new File(tomcatHome, "bin/bootstrap.jar"));
   java.setFork(true);
   java.setFailonerror(true);
   java.createArg().setValue("start");
   java.createJvmarg().setValue("-Dcatalina.base=" + tomcatHome.getPath());
   java.createJvmarg().setValue("-Dcatalina.home=" + tomcatHome.getPath());
   java.createJvmarg().setValue("-Djava.io.tmpdir=" + new File(tomcatHome, "temp").getPath());

   getLog().debug("Using JAVA_OPTS: " + javaOpts);
   java.createJvmarg().setLine(javaOpts);

   java.execute();
 }

}
```



To be fair, cargo might be intended for a different audience. It could be the *perfect* tool for Java system administrators that manage lots of various applications with a heterogeneous deployment infrastructure. My issues with cargo may be acceptable for others to deal with, but for me, it's time to move on.
