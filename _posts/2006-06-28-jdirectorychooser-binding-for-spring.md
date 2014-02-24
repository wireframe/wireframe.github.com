---
layout: post
title: "JDirectoryChooser Binding for Spring Richclient"
date: 2006-06-28
comments: false
tags:
 - java
 - swing
 - spring
 - springrcp
---

I've been continuing work on [shard](http://shard.codecrate.com), and one aspect that's been bothering me is how we handle importing of datasets. I **really** dislike the current implementation using a Swing JFileChooser. It doesn't give the user enough context to know that they've selected a valid dataset. So, I decided to check out the JDirectoryChooser from the [common l2fprod project](http://common.l2fprod.com).



I have really enjoyed this component for the past couple days, so I decided to do some work to integrate it into [spring richclient](http://spring-rich-c.sf.net). My main goal was to add a custom binding so that data entry forms can automatically use this component if their model object has a java.util.File property. Here's an example of how to use the new binding control:



```java
public class DirectorySelectionForm extends AbstractForm {
    private static final String PAGE_NAME = "importPage";

    public DirectorySelectionForm(FormModel formModel) {
        super(formModel, PAGE_NAME);
    }

    protected JComponent createFormControl() {
        SwingBindingFactory bindingFactory = (SwingBindingFactory) getBindingFactory();

        JDirectoryChooser directoryChooser = new JDirectoryChooser();
        directoryChooser.setControlButtonsAreShown(false);

        TableFormBuilder formBuilder = new TableFormBuilder(bindingFactory);
        formBuilder.add(new JDirectoryChooserBinding(getFormModel(), "selectedDirectory", directoryChooser));

        return formBuilder.getForm();
    }
}

```



The code to build this custom binding was pretty straightforward and might be another cantidate for inclusion into the [common l2fprod spring-rcp components](http://common.l2fprod.com/articles/taskpane-springrcp.php).



```java
public class JDirectoryChooserBinding extends CustomBinding {

    private final JDirectoryChooser component;

    public JDirectoryChooserBinding(FormModel model, String property, JDirectoryChooser component) {
        super(model, property, File.class);
        this.component = component;
    }

    protected JComponent doBindControl() {
        component.setSelectedFile((File)getValue());
        component.addPropertyChangeListener(new PropertyChangeListener() {
            public void propertyChange(PropertyChangeEvent evt) {
                String prop = evt.getPropertyName();
                if(JDirectoryChooser.SELECTED_FILE_CHANGED_PROPERTY.equals(prop)) {
                    File file = (File) evt.getNewValue();
                    controlValueChanged(file);
                }
            }
        });
        return component;
    }

    protected void readOnlyChanged() {
        component.setEnabled(isEnabled() && !isReadOnly());
    }

    protected void enabledChanged() {
        component.setEnabled(isEnabled() && !isReadOnly());
    }

    protected void valueModelChanged(Object newValue) {
        component.setSelectedFile((File)newValue);
    }
}

```



I also built a simple binder that would allow you to register all java.util.File properties to use this JDirectoryChooserBinding.


```java
public class JDirectoryChooserBinder extends AbstractBinder {

    protected JDirectoryChooserBinder() {
        super(File.class);
    }

    protected JComponent createControl(Map context) {
        return new JDirectoryChooser();
    }

    protected Binding doBind(JComponent control, FormModel formModel, String formPropertyPath, Map context) {
        final JDirectoryChooser directoryChooser = (JDirectoryChooser) control;
        return new JDirectoryChooserBinding(formModel, formPropertyPath, directoryChooser);
    }
}

```



Simple, but there seem to be a few issues to be worked out yet. I tried adding a custom validator to my model object to make sure that the selected directory contained relevant files, but the validator did not work correctly. It always showed the selected directory as null. I'm assuming this is an issue with my validator, but I haven't been able to figure this out yet.



That's all for now.
