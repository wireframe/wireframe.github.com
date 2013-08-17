---
layout: post
title: "Next Generation Reporting System"
date: 2004-02-21
comments: false
categories:
 - java
---

Although I am a big fan of the [openreports](http://oreports.sf.net) project and their goals, I think their design is slightly flawed and could use some improvement. One flaw is the reliance on database storage. If a report is uploaded, it should be available without further configuration. Another problem is it's webcentric nature. It is impossible to embed reports deployed on the application server into client side apps.

   
JMX may very well be the key to create the next generation reporting system and I'm tossing around ideas right now to start work on it soon. The great thing about JMX is that in a way it mirrors a database of registered components. In this reporting system, reports would be deployed as JMX components that expose 3 main functions; one for building the report, one for building a chart, and one for any required parameters to build the reports.

   
Once the reports are deployed as JMX objects, another JMX object would act as the report loader, so by passing in the JMX name of the report you want built, it would be looked up, built and cached for a period of time.

   
Still early, but it all seems to fit together. Any comments or suggestions?

