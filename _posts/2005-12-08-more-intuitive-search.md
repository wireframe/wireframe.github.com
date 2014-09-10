---

title: "More Intuitive Search"
date: 2005-12-08
comments: false
tags:
 - java
 - shard
 - search
---

One of the coolest features in [shard-phoenix](http://shard.codecrate.com) is the quick search.  My first version of the quick search was a "Search when you type" implementation where every keypress fired off a search and updated the GUI.  Although impressive, it was not exactly usable.  Performing a search for every single keypress is simply too expensive, especially on slower PC's.


What I really wanted was a "Search when you pause" implementation.  I wanted the user to type in their query phrase, and fire off the search when they have a delay (300 milliseconds seems to be the magic number).  I was fairly surprised at the lack of examples or tutorials to help me accomplish this and that's why I'm posting my "slimmed down" implementation here.  The complete source code can be found as part of the [shard-phoenix project](https://shard.dev.java.net/source/browse/shard/shard-phoenix/src/main/java/com/codecrate/shard/ui/component/).

```java
public class SearchComponent extends JPanel {
    private static final int SEARCH_DELAY_MILLIS = 300;
    private JTextField queryText = null;
    private Timer timer = new Timer();

    public SearchComponent() {
        super();
        add(getQueryText(), null);
    }

    private JTextField getQueryText() {
        if (queryText == null) {
            queryText = new JTextField();
            queryText.setColumns(10);
            queryText.getDocument().addDocumentListener(new SearchDocumentListener());
        }
        return queryText;
    }

    private class SearchDocumentListener implements DocumentListener {
        public void changedUpdate(DocumentEvent event) {
            processEvent(event);
        }
        public void insertUpdate(DocumentEvent event) {
            processEvent(event);
        }
        public void removeUpdate(DocumentEvent event) {
            processEvent(event);
        }
        private void processEvent(DocumentEvent event) {
            Document document = event.getDocument();
            try {
                String value = document.getText(0, document.getLength()).trim();
                if (0 < value.length()) {
                    TimerTask delaySearchTask = new DelaySearchTask(value);
                    timer.schedule(delaySearchTask, SEARCH_DELAY_MILLIS);
                } else {
                    //clear search filter
                }
            } catch (BadLocationException e) {
                //print error
            }
        }
    }

    private class DelaySearchTask extends TimerTask {
        private final String originalInput;

        public DelaySearchTask(String originalInput) {
            this.originalInput = originalInput;
        }
        public void run() {
            if (!hasInputChanged()) {
                //perform search now!
            }
        }
        private boolean hasInputChanged() {
            return !originalInput.equals(getQueryText().getText());
        }
    }
}
```
