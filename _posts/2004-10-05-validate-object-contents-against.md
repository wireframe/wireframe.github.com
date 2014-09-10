---

title: "Validate object contents against database structure"
date: 2004-10-05
comments: false
tags:
 - java
 - database
---

If using object to relational database mapping tools like hibernate or jdo, how can you validate that the object has valid contents before persisting? Database errors are not consistent across platforms and for the most part users' don't understand what went wrong. I would like to programatically check that a field's null/not-null status and verify that the object size does not break the database column. XWork has an object validation framework, and I'm wondering if it's possible to hook onto that framework to make a connection to the database and validate the object contents before it's persisted.


Necessary Steps:


  1. get object to validate.


  2. get database connection settings.


  3. extract metadata about column(s) to validate (table, column names).


  4. get column size and isNullable flag.


  5. compare to object field and throw "user friendly" exception if invalid.





Hibernate appears to make it easy to extract both connection settings and object metadata, so I'm going to try and tackle this first. Hopefullly it won't take long, and I'll be able to post some results soon. If anyone out there has gone through something similar, I'd love to hear about it.


Resources:


  - http://www.jguru.com/faq/view.jsp?EID=1184


  - http://wiki.opensymphony.com/display/XW/Building+a+Validator


  - http://www.hibernate.org/hib\_docs/api/index.html


  - http://www.mail-archive.com/hibernate-devel@lists.sourceforge.net/msg03272.html



