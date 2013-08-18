---
layout: post
title: "Wicket AjaxEditInPlaceLabel"
date: 2006-10-03
comments: false
categories:
 - javascript
 - java
 - scriptaculous
 - wicket
 - ajax
---

I think it's time to put back on my Wicket hat, and start kicking ass again. It's been a while since I've worked with Wicket, and I've picked it back up for a new project I'm working on. It's an AJAX heavy application, and that's where Wicket (and scriptaculous) really shine.



My first AJAX Wicket component that I need is an Edit In Place Label. You'll find examples of this component all over the web. [Flickr](http://www.flickr.com) uses this type of component heavily, and you can browse through the [scriptaculous](http://script.aculo.us/) examples for others.



I want the client code to be nearly identical to creating a normal textfield. No special interfaces or extra hoops to jump through. The value from the AJAX call should be saved on the object, just the same as for a textfield.



```java
public EditPresentationPanel(String wicketId, MyObject myObject) {
  super(wicketId);
  add(new AjaxEditInPlaceLabel("name", new PropertyModel(myObject, "name")));
}

```



So, without further delay, here's the code! I'll be checking this into the wicket-stuff project as soon as I cleanup a bit of the other code in that project. It's still using scriptaculous version 1.5!



```java
public class AjaxEditInPlaceLabel extends AbstractTextComponent {
  private AbstractAjaxBehavior handler;

  public AjaxEditInPlaceLabel(String wicketId, IModel model) {
    super(wicketId);
    setModel(model);

    this.handler = new AbstractAjaxBehavior() {
      protected String getImplementationId() {
        return "scriptaculous";
      }
      protected void onRenderHeadInitContribution(Response response) {
        writeJsReference(response, new PackageResourceReference(AjaxEditInPlaceLabel.class, "prototype.js"));
        writeJsReference(response, new PackageResourceReference(AjaxEditInPlaceLabel.class, "scriptaculous.js"));
      }

      public void onRequest() {
        FormComponent formComponent = (FormComponent) getComponent();
        formComponent.validate();
        if (formComponent.isValid()) {
          formComponent.updateModel();
        }
        String value = formComponent.getValue();
        RequestCycle.get().setRequestTarget(new StringRequestTarget(value));
      }
    };
    add(handler);

    setOutputMarkupId(true);
  }

  public String getInputName() {
    return "value";
  }

  protected final void onComponentTagBody(final MarkupStream markupStream, final ComponentTag openTag) {
    replaceComponentTagBody(markupStream, openTag, getValue());
  }

  protected void onRender(MarkupStream markupStream) {
    super.onRender(markupStream);

    JavascriptBuilder builder = new JavascriptBuilder();
    builder.addLine("new Ajax.InPlaceEditor('" + getMarkupId() + "', ");
    builder.addLine("  '" + handler.getCallbackUrl() + "', ");
    builder.addLine("  {});");
    getResponse().write(builder.toString());
  }
}

```



There are a couple things I really like about this implementation. This component gets form validation "for free", which makes it very easy to reuse other Wicket validators for this component.



Creating this component took me longer than I was hoping, but that's largly because I'm a bit rusty with Wicket. It was a bit difficult to follow other Wicket AJAX examples out there because my app is built for Wicket-1.2 and most of the example code has been written for Wicket-2.0.
