---
layout: post
title: "Simple Hibernate Search Engine"
date: 2005-08-17
comments: false
tags:
 - java
 - shard
 - search
 - database
---

Wouldn't it be great to be able to use a powerful search engine on your business objects? Searching is becoming THE preferred way for user's to find their data. Emerging applications like [Google Desktop](http://desktop.google.com) and [Beagle](http://beaglewiki.org/Main_Page) have embraced the new mantra of user's to "Search, Don't Sort". User's don't want to be forced to organize their data into limiting categories or folders, or to scroll around applications to find the data they are looking for. Even common GUI practices like table sorting are considered an eye sore compared to a snappy search box.



I have experienced the same expectation when working with my D20 datasets. It's become increasingly difficult to manage lists of skills, feats and items across multiple sources. To try and improve the user experience, I have [integrated a full blown search engine](http://jira.codecrate.com/browse/SHA-84) into [shard](http://shard.codecrate.com).



My goal was create a simple search framework to handle simple searching for the majority of my domain objects out of the box. I wanted all of my objects to be placed into the same index, and my search to be smart enough to know what object's I want returned. Something that made the client API as simple as:



```java
Collection results = searcher.search(DefaultSkill.class, "knowledge arc*");
```

In order for the searcher to be smart enough to know what type of objects to search and what type of objects to return from Hibernate, the datatype and the unique Hibernate key need to exist in the index.



<table>

<tr>

<th>Object</th>

<th>Id</th>

<th>Text</th>

</tr><tr>

</tr><tr>

<td>foo.bar.MyObject</td>

<td>123</td>

<td>Happy Dog</td>

</tr>

<tr>

<td>foo.bar.YourObject</td>

<td>456</td>

<td>Yellow Puppy</td>

</tr>

</table>


The first piece of the puzzle was to figure out how to create an index with my persistent objects. I found that the Hibernate Interceptor provided an excellent entry point for indexing my objects. It was actually pretty simple to implement.



```java
public class LuceneInterceptor implements Interceptor {
    private static final Log LOG = LogFactory.getLog(LuceneInterceptor.class);
    private static final boolean DO_NOT_CREATE_INDEX = false;

    private final Directory directory;
    private final Analyzer analyzer;

    public LuceneInterceptor(DirectoryManager directoryManager) {
        this.directory = directoryManager.getDirectory();
        this.analyzer = new StandardAnalyzer();
    }

    public boolean onSave(Object entity, Serializable id,
            Object[] currentState, String[] propertyNames, Type[] types)
            throws CallbackException {

        //this call cleans out any existing document in the index
        removeDocuments(id);

        IndexWriter writer = null;
        try {
            writer = new IndexWriter(directory, analyzer, DO_NOT_CREATE_INDEX);
            Document document = new Document();
            document.add(Field.Keyword(LuceneSearcher.FIELD_CLASS, entity.getClass().getName()));
            document.add(Field.Keyword(LuceneSearcher.FIELD_ID, id.toString()));

            //This is a VERY simplistic way to index data about the entity
            //ideally you would have some kind of extension point to allow for more detailed
            //information to be extracted about the entity based on the datatype
            document.add(Field.Text(LuceneSearcher.FIELD_TEXT, entity.toString()));

            LOG.info("saving " + document);
            writer.addDocument(document);
        } catch (IOException e) {
            LOG.error("Error updating index for object " + entity, e);
        } finally {
            closeWriter(writer);
        }

        return false;
    }

    public void onDelete(Object entity, Serializable id, Object[] state,
            String[] propertyNames, Type[] types) {
        removeDocuments(id);
    }

    private void removeDocuments(Serializable id) {
        IndexReader reader = null;
        try {
            reader = IndexReader.open(directory);
            int numDeleted = reader.delete(new Term("id", id.toString()));
            if (0 < numDeleted) {
                LOG.info("Removed " + numDeleted + " documents from index " + directory);
            }
        } catch (IOException e) {
            LOG.error("Error removing documents for " + id + " from index " + directory, e);
        } finally {
            closeReader(reader);
        }
    }

    private void closeWriter(IndexWriter writer) {
        if (null != writer) {
            try {
                writer.close();
            } catch (IOException e) {
                LOG.warn("Error while closing index writer", e);
            }
        }
    }

    private void closeReader(IndexReader reader) {
        if (null != reader) {
            try {
                reader.close();
            } catch (IOException e) {
                LOG.warn("Error closing index reader for index " + directory, e);
            }
        }
    }

    // ommitted other interceptor methods

}
```



Next up was creating the simple/smart searcher which is responsible for performing the lucene search and looking up the records in Hibernate.



```java
public class LuceneSearcher extends HibernateTemplate {
    public static final String FIELD_CLASS = "class";
    public static final String FIELD_TEXT = "text";
    public static final String FIELD_ID = "id";

    private static final Log LOG = LogFactory.getLog(LuceneSearcher.class);
    private static final boolean REQUIRED = true;
    private static final boolean NOT_PROHIBITED = false;

    private final Directory directory;
    private final Analyzer analyzer;

    public LuceneSearcher(DirectoryManager directoryManager) {
        this.directory = directoryManager.getDirectory();
        this.analyzer = new StandardAnalyzer();
    }

    public Collection search(Class target, String query) {
        Searcher searcher = null;
        Collection results = new ArrayList();

        try {
            searcher = new IndexSearcher(directory);
            BooleanQuery masterQuery = new BooleanQuery();
            masterQuery.add(new TermQuery(new Term(FIELD_CLASS, target.getName())), REQUIRED, NOT_PROHIBITED);
            masterQuery.add(QueryParser.parse(makeWildcardQuery(query), FIELD_TEXT, analyzer), REQUIRED, NOT_PROHIBITED);

            LOG.info("Searching for " + masterQuery);

            Hits hits = searcher.search(masterQuery);
            LOG.info("Found " + hits.length() + " matches");
            for (int x = 0; x < hits.length(); x++) {
                Document document = hits.doc(x);
                String id = document.getField(FIELD_ID).stringValue();

                //lookup the object from hibernate
                Object result = this.get(target, id);
                if (null == result) {
                    LOG.warn("Search index is out of synch with database.  Unable to find object " + target + " with id " + id);
                } else {
                    results.add(result);
                }
            }

        } catch (Exception e) {
            LOG.error("Error searching directory " + directory + " for type " + target + " using query " + query, e);
        } finally {
            closeSearcher(searcher);
        }

        return results;
    }

    private String makeWildcardQuery(String query) {
        String result = query.trim();
        if (0 != result.length()) {
            if (!result.endsWith("*")) {
                result = result + "*";
            }
        }
        return result;
    }

    private void closeSearcher(Searcher searcher) {
        if (null != searcher) {
            try {
                searcher.close();
            } catch (IOException e) {
                LOG.warn("Error closing searcher", e);
            }
        }
    }
}
```



This solution works like a charm, and is easily extensible for future improvements. You can check it out in action by [launching the shard-phoenix data management application](http://www.codecrate.com/display/SHA/Home). Complete source code can be found in the [shard-hibernate subproject](https://shard.dev.java.net/source/browse/shard/shard-hibernate/).

