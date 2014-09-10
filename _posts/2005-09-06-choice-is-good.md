---

title: "Choice Is Good"
date: 2005-09-06
comments: false
tags:
 - java
 - scriptaculous
 - wicket
 - ajax
---

I've spent the last couple weeks straining my brain to create [a slick autocomplete text field for Wicket]({% post_url 2005-08-23-wicket-autocomplete-text-field %}). Over this time, I've come up with several different use cases for such a component. Now, instead of trying to create one uber component that can do it all, I have decided that it makes more sense to have different components for different use cases. This should make it much easier for users since each component has a very explicit and simple API.



### AutocompleteTextField


This is the basic autocomplete implementation that is 100% AJAX free. Simply instantiate the text field with all the possible options, and scriptaculous' built in filtering features will take care of the rest. This is an easy solution for small datasets.


```java
String[] results = new String[] {
    "Red"
    , "Blue"
    , "Purple"
    , "Orange"
};
add(new AutocompleteTextField("color", results));
```



### AjaxAutocompleteTextField


And now for some AJAX magic. The AjaxAutocompleteTextField provides a simple callback to allow for dynamically populating the list of available auto completions based on the user input.


```java
add(new AjaxAutocompleteTextField("fruit") {
    public String[] getResults(String input) {
        //lookup potential results from database or something
        return new String[] {
            "Apple"
            , "Banana"
        };
    }
});
```

### CustomLayoutAjaxAutocompleteTextField


My [previous blog entry]({% post_url 2005-08-25-autocomplete-more-than-just-text %}) introduced how to autocomplete more than just text. I wanted to improve the API so that the html markup would be done outside the Java code.



After several iterations, I created something called a PageContribution. The concept behind a PageContribution is that it supplies only a portion of the html for a page. This allows for users to completely customize the layout of autcomplete results. The CustomLayoutAjaxAutocompleteTextField delegates the rendering of the autocomplete results to the PageContribution. Under the covers, it works exactly as a normal Wicket page, but it's intention is to only provide markup for the autocomplete results.



There are a number of benifits to this approach. Not only can you completely customize the layout of the autocomplete results, you can also directly invoke the autocomplete results as a seperate page to preview the results. This is one feature of the scriptaculous examples that really impressed me. Simply view the source of the demo and you can extract the url for the autocomplete component.



```java
add(new CustomLayoutAjaxAutocompleteTextField("emailAddress", ExampleAjaxAutocompletePageContribution.class));
```


A helper abstract class (CustomLayoutAutocompleteResultsPageContribution) is available to handle extracting the user's input from the correct input parameter.


```java
public class ExampleAjaxAutocompletePageContribution
    extends CustomLayoutAutocompleteResultsPageContribution {

    public ExampleAjaxAutocompletePageContribution(PageParameters parameters) {
        super(parameters);
    }

    protected ListView buildListView(String input) {
        //lookup results from string input
        List results = new ArrayList();
        results.add(new CustomResultObject("ryan.gif", "Ryan Sonnek", "ryan@youremail.com"));
        results.add(new CustomResultObject("billy.gif", "Bill Gates", "bill.gates@microsoft.com"));

        return new ListView("entries", results) {
            protected void populateItem(ListItem item) {
                CustomResultObject result = (CustomResultObject) item.getModelObject();

                item.add(new Label("name", result.getName()));
                item.add(new Label("email", result.getEmail()));
            }
        };
    }
```

The PageContribution then supplies it's own html markup for how to render the autocomplete results,


```html
&lt;ul wicket:id="entries"&gt;
  &lt;li&gt;
    &lt;div wicket:id="name">Ryan Sonnek&lt;/div&gt;
    &lt;div wicket:id="email">ryan@somewhere.com&lt;/div&gt;
  &lt;/li&gt;
&lt;/ul&gt;
```

I have added examples for each of these use cases to [wicket-stuff](http://wicket-stuff.sf.net) along with a Jetty launcher for anyone that wants to give them a test drive.

