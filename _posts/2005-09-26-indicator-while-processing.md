---
layout: post
title: "Indicator While Processing"
date: 2005-09-26
comments: false
tags:
 - java
 - wicket
---

Most users rely on the broswer's "spinner" to know when the server is processing and when it has completed, but with AJAX applications, all bets are off. There's no way for a user to know if clicking a button will take them to a new page, or swap dynamic HTML into the existing page.



The [scriptaculous demos](http://script.aculo.us/demos/shop) have solved this problem by showing an inline indicator while the server is processing, and I have now added this feature to wicket as well. The indicator will only display while the server is processing the AJAX request. The DraggableTarget is the first component to interact with this [new Indicator component](http://cvs.sourceforge.net/viewcvs.py/wicket-stuff/wicket-contrib-scriptaculous/src/java/wicket/contrib/scriptaculous/dragdrop/), and I think the AutocompleteTextField may have use for it as well. Here's a short example of how to use the new Indicator.



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



The HTML template just needs to include the indicator, and CSS can be used to customize it further.


```html
&lt;html xmlns:wicket="http://wicket.sourceforge.net/"&gt;
&lt;head&gt;
  &lt;style type="text/css"&gt;
  div.cart-active {
    background-color: #FFF4D8;
  }
  &lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;
  &lt;img wicket:id="product" alt="Drag Me!"&gt;

  &lt;div wicket:id="indicator" /&gt;
  &lt;-- The contents of this div are swapped out with the page contribution --&gt;
  &lt;div wicket:id="cart"&gt;Drop images here.&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
```

I've updated the [drag/drop examples](http://cvs.sourceforge.net/viewcvs.py/wicket-stuff/wicket-contrib-scriptaculous-examples/src/java/wicket/contrib/scriptaculous/examples/dragdrop/) to use this new indicator, and I also added a short server side delay to actually show that it's working correctly. Isn't it odd that a user might not believe an application is working correctly if it's too fast?

