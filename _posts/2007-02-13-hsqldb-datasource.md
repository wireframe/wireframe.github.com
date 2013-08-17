---
layout: post
title: "HSQLDB Datasource"
date: 2007-02-13
comments: false
categories:
 - java
 - database
---

I use [HSQLDB](http://hsqldb.org) in my development environment, and for the most part it works great. I ran into a recent issue though that caught me off guard.



As you may (or may not) know, HSQLDB only allows for one connection to the database at a time. Most applications will work fine with this limitation, unless you have an embedded application that can be started and restarted within the same JVM.



HSQLDB uses a JVM shutdown hook to release the database lock which can be an issue if your application doesn't kill the JVM when "shutting down". Here's a scenerio when this can be an issue:



  1. Embedded application starts up. A new JVM is initialized.


  2. Database Datasourcestarts up and connects to the database. HSQLDB will create the file lock.


  3. Embedded application is shutdown. The JVM does not exit.


  4. Datasourcecloses, but HSQLDB does not release the file lock since the JVM did not exit.


  5. Embedded application is restarted in the same JVM.


  6. Database Datasourcestarts up and tries to connect to the database. A big fat stacktrace is thrown because the HSQLDB database is still locked from the previous instance.





So, I did a bit of searching and found that you can manually tell HSQLDB to shutdown and release the database lock. Here's a nice little extension to the [commons dbcp](http://jakarta.apache.org/commons/dbcp/)Datasource that will correctly shutdown HSQLDB when the Datasource is closed.



```java
/**
 * Datasource that shuts down the hsqldb when the data source is closed.
 * hsql is normally only shutdown with a JVM hook, so this datasource is
 * better suited when you need to shutdown/restart within one JVM.
 *
 * @see http://hsqldb.org
 */
public class HsqldbDataSource extends BasicDataSource {
 @Override
 public synchronized void close() throws SQLException {
   Connection conn = getConnection();
   Statement statement = conn.createStatement();
   statement.executeUpdate("SHUTDOWN");
   statement.close();
   conn.close();

   super.close();
 }
}

```
