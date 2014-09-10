---

title: "FinderTemplate"
date: 2006-08-07
comments: false
tags:
 - ruby
 - java
---

I think I'm becoming addicted to Ruby syntax. The Ruby collection API is super slick, and since I've already brought [a Ruby-like iteration syntax to Java](http://jroller.com/page/wireframe?entry=humane_object_iteration), I think it's logical to try and port [the Ruby find syntax](http://www.rubycentral.com/ref/ref_m_enumerable.html#find) to Java as well.



My goal is to create a simple client API for looping through a collection, looking for a certain object. Here's how I want it to work.



```java
MyObject foundObject = (MyObject) new FinderTemplate(entries) {
  protected boolean isMatch(Object object) {
    MyObject entry = (MyObject) object;

    //perform any required matching logic

    return true;
  }
}.find();
```




The code for the FinderTemplate is very similar to my previous IteratorTemplate. Nothing too fancy, but it's pretty slick.



```java
public abstract class FinderTemplate {
  private final Collection objects;

  public FinderTemplate(Collection objects) {
    this.objects = objects;
  }

  public Object find() {
    for (Iterator iter = objects.iterator(); iter.hasNext();) {
      Object element = (Object) iter.next();
      if (isMatch(element)) {
        return element;
      }
    }
    return null;
  }

  protected abstract boolean isMatch(Object object);
}
```



What I think is very cool is how this FinderTemplate can be extended ever so slightly to add a findAll method. So, instead of just finding _one_object, you can find _all_ objects that meet your criteria.



Here's the only change needed to the FinderTemplate to add this new behaviour.


```java
public Collection findAll() {
  Collection results = new ArrayList();
  for (Iterator iter = objects.iterator(); iter.hasNext();) {
    Object element = (Object) iter.next();
    if (isMatch(element)) {
      results.add(element);
    }
  }
  return results;
}
```



I think it would be great if this code could find a home somewhere like [commons-collections](http://jakarta.apache.org/commons/collections/). I'm not sure if there's much interest for this code though, unless you've been exposed to Ruby.
