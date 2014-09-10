---

title: "Combining Project Support Tools"
date: 2005-05-02
comments: false
tags:
 - java
---

There are a variety of tools out there that can be used to provide project support. I feel like these different tools need to converge somewhere to allow for users/developers easier access to information and feedback. Here are the current tools in use by projects today. All of them have their advantages and disadvantages, but the one thing they all have in common is that noone has found a way to combine and leverage all of these tools together.



Mailing Lists

Favored by developers, and shunned by users.



Forums

Slick user interfaces usually with built in search tools. Slower than mailing lists. Some forums are starting to integrate with mailing lists so that posting on one, will automatically post on the other. Most forums have functionality to display "current logged in users" (based off a session cookie).



Realtime Messaging

IRC, and online chat (instant messenger) tools fall into this category.



I wonder how difficult it would be for online forums to be integrated with a messaging client? It'd be nice see online forums integrate the list of online users with who's logged into a common chatroom. Posts to that chatroom would be automatically posted on the forums as well (for archiving and searching purposes). Perhaps a certain posting syntax would be required in order to avoid "TONS" of extra noise. Here would be my ideal solution:



  1. A user is looking for help/information so they hop on the project forums first. The forums list several users/developers as "online", and have a public chatroom available for the user to connect to.


  2. The user joins the public chatroom and posts a question (which noone was able to answer).


  3. The forum software automatically saves this post and sends out a cross-post to the pre-configured mailing list.


  4. A developer who is not online, gets the email and replies back with an answer.


  5. The forum software automatically saves this post and sends out an email to the user that their question has been answered.




[Jive Software](http://www.jivesoftware.com/support-suite.jsp) seems to have a start on this idea by combining these tools, but unfortunately it's also extremely pricey. Anyone out there seen something that opensource communities have done to solve this problem?

