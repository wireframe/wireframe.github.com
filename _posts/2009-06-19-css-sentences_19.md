---
layout: post
title: "CSS Sentences"
date: 2009-06-19
comments: false
categories:
 - css
---

CSS psuedo selectors are pretty awesome and on my current project I've been able to take advantage of them for a fairly complex task, creating a humane sentence out of a list of items.
   
   
Here's the markup I'm working with:
   
   
   - Ryan

   
   - Tom

   
   - Bill

   
   
   
And here's the output I want the users to see:
   
"Ryan, Tom and Bill found this interesting."
   
   
Normally, I would use serverside processing (ex: rails helper) or javascript to do all the work, but CSS psuedo selectors are able to accomplish the same thing!
   
   
/* makes the list display inline */
   
ul { list-style-type: none; margin: 0; padding: 0; display: inline; }
   
ul li { background: none; margin: 0; padding: 0; display: inline; }
   
   
/* display a comma before the element */
   
ul li:before { content: ', '; }
   
   
/* use ' and ' instead of a comma for the last element */
   
ul li:last-child:before { content: ' and '; }
   
   
/* remove the prefix from the very first element */
   
ul li:first-child:before { content: ''; }
   
   
/* use a suffix to complete the sentance */
   
ul li:last-child:after { content: ' found this interesting.'; }
   
   
This solution isn't applicable for most web applications if they need to support crappy web browsers *cough* IE *cough*, but for this project, I only need to support Webkit, and it works like a dream.