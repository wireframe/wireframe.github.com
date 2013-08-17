---
layout: post
title: "Testing is a Roadblock"
date: 2009-07-12
comments: false
categories:
 - testing
---


   
   
Testing are vital part of any development process for a lot of reasons. I've talked about testing quite [frequently](http://jroller.com/wireframe/entry/running_code_doesn_t_lie)[on this](http://jroller.com/wireframe/entry/actions_speak_louder_than_words)[blog](http://www.jroller.com/wireframe/entry/say_it_do_it_prove), and over the past year, I've learned a new key benefit of testing:Testing creates a roadblock to prevent unnecessary code/features from being written.
   

   
Some people claim that simple code don't need tests. My response is, "if code doesn't have tests, it wasn't worth writing in the first place." If it's so trivial that you don't need tests, why are you writing it? Is it boilerplate code for getter/setters required by your framework? That's a sign you're using the wrong tool/language for the job.
   
Writing tests forces you to put what you're thinking in your head down into writing. If it's not worth the effort to take a moment and reflect on how it's supposed to work, it's not worth putting into code and it doesn't deserve to be in your system!
   
This barrier to entry also prevents the "wouldn't it be cool" features that provide absolutely nocore business value. All that's usually needed is to simply ask, "How are we going to test this?" to stop the conversation dead in it's tracks. By carrying around the Big Testing Stick (BTS), you can knock these features flat on their ass if no one is willing to invest the time to actually think through the feature at hand.
   
At a very practical level, this mentality has led me to invest time extracting or reusing plugins from the Rails community to accomplish tasks that I were not worth me taking the time to describe and test. Sure, most of these helper plugins are fairly trivial and I could have cranked out the code in a matter of minutes, but this mantra has kept my project codebase a bit leaner. This has additional benefits by reducing the long term maintenance cost of your application and lowers the cognitive load required to get new developers up and running.
   
