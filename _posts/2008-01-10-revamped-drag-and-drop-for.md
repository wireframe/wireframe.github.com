---

title: "Revamped Drag and Drop for Scriptaculous"
date: 2008-01-10
comments: false
tags:
 - javascript
 - java
 - scriptaculous
 - wicket
 - ajax
---

Drag and drop support in wicketstuff-scriptaculous project has undergone some major changes over the past few days.



First off, I upgraded to the latest and greatest 1.8.1 version of scriptaculous. Whoo hoo. Hopefully scriptaculous 2.0 will be making an appearance sometime soon.



Now for the real meat of the changes...



There was a really good conversation on the wicket mailing list about improving the API for drag and drop. The main complaint is that we should be able to infer which wicket component was being dragged instead of just passing around a string id reference. I thought this was absolutely brilliant and would really showcase wicket's strength for writing Object Oriented web applications (unlike some other scripting frameworks).



Here's a very simple example of what the new API looks like. It really hasn't changed that much. The onDrop callback now returns a Component instead of a String.



```java
public class DragDropExamplePage extends WebPage {
 public DragDropExamplePage() {
   Label product = new Label("product");
   product.addBehavior(new DraggableBehavior());
   add(product);

   DraggableTarget cart = new DraggableTarget("cart") {
     protected void onDrop(Component input, AjaxRequestTarget target) {
       System.out.println(input + " dropped on the target");
     }
   };
   add(cart);
 }
}
```



This is particularly exciting for complex applications or for manipulating the Model object of the dropped Component. Logic can continue to be encapsulated in custom components and the onDrop callback shouldn't need any extra logic for looking up the component that was modified.



One other note is that the SortableListView underwent some major plumbing as well, but the API has not changed. I dug through the wicket core API to better understand how ListView's are intended to work. I was able to remove a bunch of dirty hacks and use the ListView in a much cleaner and better supported way.



Download the latest version and enjoy! Let me know if there are any other API improvements that would be useful!



