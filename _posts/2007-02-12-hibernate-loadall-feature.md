---

title: "Hibernate LoadAll Feature"
date: 2007-02-12
comments: false
tags:
 - java
 - hibernate
 - database
---

I've used [Hibernate](http://hibernate.org) off and on over the years, and just recently discovered one of its weirdest features.



I'll setup a simple test scenerio to best illustrate the behavior.  First, I'll create a persistent object that has a mapped Collection. The classic Department/Employee example seems to fit the bill.


```java
@Entity
public class Department {
 @OneToMany
 private Collection employees;
}
```



Now, here's a simple Spring DAO that is used to load all the Departments.

```java
public class DepartmentDao extends HibernateDaoSupport {

 public List getDepartments() {
   return getHibernateTemplate().loadAll(Department.class);
 }
}
```


Okay.  This all works great.  Let's make one little change to have the Employee's loaded eagerly instead of lazily.


```java
@Entity

public class Department {
 @OneToMany(fetch=FetchType.EAGER)
 private Collection employees;
}
```

With this one little change, the shit hits the fan.  Now, duplicate Departments show up on my listing page.  Why the hell are duplicates showing up?  Hibernate uses an outer join to eagerly load all of the Employee information with the Department.  So, when it queries for all Departments, you're actually getting back the same Department multiple times (one time for each Employee).



I could swear that this is a bug, but according to the Hibernate folks, it appears to be [Working as Designed](http://www.hibernate.org/117.html). So, I whipped up a little helper method to filter out all the duplicates.  It literally took my two hours to figure out that Hibernate was the problem and not my code.  Anyone else out there been bit by this behavior before?



```java
public class DepartmentDao extends HibernateDaoSupport {

 public List getDepartments() {
   return loadAllUnique(Department.class);
 }


 /**
 * Loads all the unique instances of a given Class (to work around issue with duplicate
 * rows when eagerly fetching collections).
 *
 * @see http://www.hibernate.org/117.html
 */
 private List loadAllUnique(Class clazz) {
   return new ArrayList(new LinkedHashSet(getHibernateTemplate().loadAll(clazz)));
 }
}
```
