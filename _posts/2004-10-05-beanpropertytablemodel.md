---

title: "BeanPropertyTableModel"
date: 2004-10-05
comments: false
tags:
 - java
---

I finally have seen the light for how powerful reflection can be. I used to painstakingly create a seperate table model for each of my java objects that I wanted to display in a table. Each class had a custom case/switch statement to return the correct value for the requested column.


In short, it was inelegant but it worked. Now, I've put together a table model for [riva](https://riva.dev.java.net) that uses [commons-beanutils](http://jakarta.apache.org/commons) to introspect a beans properties to return the correct value. It handles setting values as well, and will only set a column as editable if the object has a setter method for that property.



```java
//here was my old way of doing table models.
//each class had a custom table model.
public class MyObjectTableModel {
    private List objects = new ArrayList();

    //ommitted unimportant methods

    public void addObject(Object myObject) {
        objects.add(myObject);
    }

    public Object getObject(int row) {
       return objects.get(row);
    }

    public Object getValueAt(int row, int column) {
        MyObject object = (MyObject) getObject(row);
        Object value = null;

        switch(column) {
            case 0:
            value = object.getMyField1();
            break;

            case 1:
            value = object.getMyField2();
            break;
        }
        return value;
    }
}
```



You can see the new table by checking the [riva cvs file](https://riva.dev.java.net/source/browse/riva/riva-core/src/java/com/codecrate/riva/model/BeanPropertyTableModel.java).

