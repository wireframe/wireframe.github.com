---
layout: post
title: "Wicket Autocomplete Text Field"
date: 2005-08-23
comments: false
categories:
 - javascript
 - java
 - scriptaculous
 - wicket
 - ajax
---

Hold onto your seats boys and girls, this one entry you won't want to miss.



Anyone interested in building the next generation of web applications will hopefully have run across the [amazing script.aculo.us demos](http://script.aculo.us/demos/ajax/autocompleter_customized). Wouldn't it be great to have these ajax components out of the box with our Java frameworks? I mean, I've been impressed with [Ruby on Rails](http://www.rubyonrails.org/), but I can't see myself using it. One of my gripes with Rails is the loss of previewable HTML. Has anyone seen the [source code for the demos](http://script.aculo.us/demos/ajax/autocompleter_customized)? More importantly, can anyone understand them?



Component frameworks like [Tapestry](http://jakarta.apache.org/tapestry/) and [Wicket](http://wicket.sf.net) allow for HTML designers to take complete control of the look and feel of website design, and dynamic content is plugged in without the need to learn [new scripting languages](http://jakarta.apache.org/velocity) or use [custom XML-ish tags](http://java.sun.com/products/jsp/jstl/). Or, does it seem a bit too logical to have HTML designers just use HTML when designing websites? =)



I've been so impressed with Wicket and script.aculo.us, that I spent about 4 hours Friday night digging into the [experimental ajax support in Wicket](http://jroller.com/page/dashorst?entry=wicket_1_1_beta1_and). My goal was to create a reusable autocomplete text field that would allow for any Wicket application to add the same functionality with a minimum amount of effort.



This example AutocompleteTextField is just an extention of the normal Wicket text field with some additional javascript and css output added. This component is built using the same [Prototype](http://prototype.conio.net/) javascript library that is used with Rails and scrit.aculo.us. I had to really dig into the internals of Wicket in order to get this to work, so it may not be for the light of heart. Hopefully someone smarter than I can figure out a more elegant approach to extending the Wicket render cycle. This code may be a bit long, but I prefer giving the whole source instead of adding extra attachments.



```java
<pre>
public class AutocompleteTextField extends TextField {
    private final AutocompleteEventHandler handler;

    public AutocompleteTextField(String id, AutocompleteResultGenerator generator) {
        super(id);
        handler = new AutocompleteEventHandler(generator);
        add(handler);
    }

    protected void onComponentTag(ComponentTag tag) {
        super.onComponentTag(tag);
        tag.put("id", getId());

        //disable browser's autocompletion on this field
        tag.put("autocomplete", "off");
    }

   /**
    * Prototype's Ajax.Autocompleter expects the autocomplete text field to have the following info:
    * &lt;input id="foo" /&gt;
    * &lt;div id="foo_autocomplete"&gt;&lt;/div&gt;
    */
    protected void onRender() {
        //render the text area
        super.onRender();

        //print the hidden div area that the autocomplete results are rendered to
        String autocompleteId = getId() + "_autocomplete";
        final String url = this.urlFor(IEventRequestListener.class) + "&amp;id=" + handler.getId();
        getResponse().write("&lt;div class=\"auto_complete\" id=\"" + autocompleteId  + "\"&gt;&lt;/div&gt;");

        //render javascript call to Prototype's Ajax.Autocompleter
        getResponse().write("&lt;script type=\"text/javascript\"&gt;new Ajax.Autocompleter('" +
            getId() + "', '" + autocompleteId + "', '" + url + "', {})&lt;/script&gt;");

        //include a BASIC stylesheet for out-of-the box usability
        getResponse().write("&lt;style type=\"text/css\"&gt;\n" +
                "         div.auto_complete {\n" +
                "            width: 350px;\n" +
                "            background: #fff;\n" +
                "            overflow: hidden;\n" +
                "          }\n" +
                "          div.auto_complete ul {\n" +
                "            border:1px solid #888;\n" +
                "            margin:0;\n" +
                "            padding:0;\n" +
                "            width:100%;\n" +
                "            list-style-type:none;\n" +
                "          }\n" +
                "          div.auto_complete ul li {\n" +
                "            margin:0;\n" +
                "            padding:3px;\n" +
                "          }\n" +
                "          div.auto_complete ul li.selected {\n" +
                "            background-color: #ffb;\n" +
                "          }\n" +
                "          div.auto_complete ul strong.highlight {\n" +
                "            color: #800;\n" +
                "            margin:0;\n" +
                "            padding:0;\n" +
                "          }\n" +
                "&lt;/style&gt;\n" +
                "");
    }

    private class AutocompleteEventHandler extends AbstractEventRequestHandler {
        private FormComponent formComponent;
        private final AutocompleteResultGenerator resultGenerator;

        public AutocompleteEventHandler(AutocompleteResultGenerator resultGenerator) {
            this.resultGenerator = resultGenerator;
        }

        public final void printHeadInitContribution(HtmlHeaderContainer container) {
            // add our basic javascript needs to the header
            //TODO: might not need to add all of these prototype scripts.
            addJsReference(container, new StaticResourceReference(AutocompleteTextField.class, "prototype.js"));
            addJsReference(container, new StaticResourceReference(AutocompleteTextField.class, "controls.js"));
            addJsReference(container, new StaticResourceReference(AutocompleteTextField.class, "dragdrop.js"));
            addJsReference(container, new StaticResourceReference(AutocompleteTextField.class, "effects.js"));
        }

        private void addJsReference(HtmlHeaderContainer container, StaticResourceReference ref) {
            String url = container.getPage().urlFor(ref.getPath());
            String s =
                "\t&lt;script language=\"JavaScript\" type=\"text/javascript\" " +
                "src=\"" + url + "\"&gt;&lt;/script&gt;\n";
            write(container, s);
        }

        private void write(HtmlHeaderContainer container, String s) {
            container.getResponse().write(s);
        }

        public void bind(Component component) {
            if (!(component instanceof FormComponent)) {
                throw new IllegalArgumentException(
                        "this handler can only be bound to form components");
            }

            if (formComponent != null) {
                throw new IllegalStateException(
                        "this kind of handler cannot be attached to "
                                + "multiple components; it is allready attached to component "
                                + formComponent + ", but component "
                                + component + " wants to be attached too");

            }

            this.formComponent = (FormComponent) component;
        }

        public void onComponentTag(Component component, ComponentTag tag) {
        }

        protected IResourceStream getResponse() {
            StringBufferResourceStream s = new StringBufferResourceStream();

            formComponent.validate();
            if (formComponent.isValid()) {
                formComponent.updateModel();
            }
            String value = formComponent.getValue();

            //render results in list
            //prototype's Ajax.Autocompleter automatically places results into the hidden div area
            s.append("&lt;ul&gt;\n");
            String[] results = resultGenerator.getResults(value);
            for (int x = 0; x &lt; results.length; x++) {
                String result = results[x];
                s.append("&lt;li class=\"contact\"&gt;" + result + "&lt;/li&gt;\n");
            }
            s.append("&lt;/ul&gt;\n");

            return s;
        }
    }
}
```


Developers can now get this sweet autocomplete text field in the application. Notice how the HTML template is exactly the same. The template has no idea of the underlying autocomplete/ajax functionality.


```html
&lt;html xmlns:wicket="http://wicket.sourceforge.net/"&gt;
  &lt;body&gt;
    &lt;form wicket:id="searchForm"&gt;
      Search:
      &lt;input wicket:id="query" type="text"/&gt;
      &lt;input wicket:id="submitButton" type="submit" value="Submit"/&gt;
    &lt;form&gt;
  &lt;/body&gt;
&lt;/html&gt;
```

It's the job of the Java form to add the new AutocompleteTextField and to register the AutocompleteResultGenerator. This example uses a hard coded list of results, but it can easily be customized to perform any custom search or lookup of information.


```java
public class SearchForm extends Form {
    public SearchForm(String id, IFeedback feedback) {
        super(id, new CompoundPropertyModel(new SearchModel()), feedback);

        AutocompleteResultGenerator searcher = new AutocompleteResultGenerator() {
            public String[] getResults(String input) {
                return new String[] {"Bob", "Jamie", "Eric"};
            }
        };

        add(new AutocompleteTextField("query", searcher));
        add(new Button("submitButton"));
    }

    protected void onSubmit() {
        //do something with the search text
    }
}
```



There's plenty of room for improvement, but I hope that this will serve as a springboard for others trying out the already impressive Wicket ajax support. It would be great to enhance API to be more Wicket friendly like returning a ListView instead of a String[]. Hopefully with a little support, this component could work it's way into wicket for other developers to use.



And to all those [insightful comments on my last blog](http://jroller.com/page/wireframe/?anchor=web_development_done_right) saying that JSP was "good enough" for a web technology, let's see JSP do this! And don't you dare mention JSF...

