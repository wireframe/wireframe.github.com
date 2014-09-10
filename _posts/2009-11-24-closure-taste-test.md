---

title: "The Closure Taste Test"
date: 2009-11-24
comments: false
tags:
 - javascript
 - jquery
---




Since the release of the [Google Closure library](http://code.google.com/closure/library/), I've spent several weeks going through their source code and giving it a fair shake with some small demos. I have not yet been able to build out a full fledged application using Closure, so let this serve as a full disclaimer that I am a jQuery Junkie and still relatively a Closure newb.


Documentation
-------------

The source code for the Closure library is chock full of great tips and is a delight to browse through. I'd recommend anyone interested in playing around with Closure to download the library via SVN and poke around.


Don't even bother looking through the [online docs](http://closure-library.googlecode.com/svn/trunk/closure/goog/docs/index.html). They simply pale in comparison to browsing the extremely well documented source code. I expected the online reference to be much more usable than their current state.


OO
--

The Google Closure library is heavily object oriented. For better or worse, it looks and feels more like a Java library and less like a scripting language than any Javascript library I've used. They definitely have put a lot of work into making Javascript behave like [object oriented developers expect](http://stackoverflow.com/questions/107464/is-javascript-object-oriented). The goog.inherits() function is an example of how Closure tries to emulate traditional object oriented programming patterns.


What is "this"?
---------------

Remember the good old days when your code was littered with [Prototype's bind() method](http://api.prototypejs.org/language/function.html#bind-instance_method)?  Closure uses a lot of Javascript prototype-ing and you often need to worry about what scope/context your functions are executing in. The majority of the Google API's make setting your context pretty straightforward.

```javascript
goog.iter.forEach(myArray, myFunction, this);

function myFunction(eachObject) {
 var element = goog.dom.createDom('div');
 goog.dom.appendChild(this.myContainer, element);
}
```


I've never been a fan of how jQuery always redefines "this" for it's callbacks, so the Closure API feels more natural to me. jQuery overrides "this" so frequently, that you don't truly know what "this" you're working with. I frequently add a little comment within each of my functions to explain what "this" actually is.

```javascript
$.each(myArray, myFunction);

function myFunction() {
 //this == eachObject in array
}
```

Events
------

Events are a very core aspect of Closure and I assume this is largely due to it's use in Google Calendar *rimshot*.


Understanding DOM events and bubbling is one of the more advanced (and powerful) Javascript techniques and Google has done a very good job at making their event pattern usable to all developers for custom events.

```javascript
mycompany.FancyWidget.WORK_COMPLETE_EVENT = 'workcomplete';

mycompany.FancyWidget = function() {
 goog.events.EventTarget.call(this);
};

goog.inherits(mycompany.FancyWidget, goog.events.EventTarget);

//dispatches the work complete event for all listeners
mycompany.FancyWidget.prototype.doWork = function() {
 this.dispatchEvent({
   type: mycompany.FancyWidget.WORK_COMPLETE_EVENT,
   someValue: 'test'
 });
};

```


Now, any client can listen for your custom events with ease:

```javascript
var widget = new mycompany.FancyWidget();

goog.events.listen(widget, mycompany.FancyWidget.WORK_COMPLETE_EVENT, myCallback);

function myCallback(e) {
 //do something with the event.
 alert(e.someValue);
}

```


Closure's event API outshines the jQuery event API. Closure event objects are a simple hash which essentially gives you named parameters which is much cleaner than the jQuery event API. jQuery event callbacks easily end up as functions with frankenstein-long argument lists and the required event argument as the first parameter totally blows. It's like some kind of weird varargs inspired API that constantly bites me in the ass.

ex:

```javascript
myElement.bind('someCustomEvent', myCallback);

function myCallback(e, someValue) {
 //do stuff here
});

myElement.trigger('someCustomEvent', [someValue]);
```


The Closure Event API is not all sunshine and roses though. It's very common to need to set your context for your event callback due to all the prototyping action (see above), but the method signature for declaring your scope is pretty weak.

```javascript
//call myFunction with the right "this" context
goog.events.listen(widget,mycompany.FancyWidget.WORK_COMPLETE_EVENT, myFunction, false, this);
```


false, this, wha?!? the mandatory 'false' parameter really sucks when you need to set the context for your callback. Doesn't Google know that [boolean parameters are evil](http://www.jroller.com/alexRuiz/entry/boolean_arguments_can_be_evil)?!? Passing an hash as the last parameter with named entries for the scope/capturePhase would have been a much cleaner solution.


Ajax
----

jQuery kicks Closure's ass around the block when it comes to Ajax. Google has done very little to abstract away the details of XHR and it definitely shows. With all of the crazy Web 2.0 Ajax-y goodness in every Google application, I was honestly expecting much more in this area.

ex:

```javascript
var request = new goog.net.XhrIo();goog.events.listenOnce(request, goog.net.EventType.SUCCESS, function() {
 //do my work here
});

request.send('http://mycompany.com', 'GET');
```


The Closure example makes my skin crawl when compared with the elegance of jQuery.

```javascript
$.get(function(data) {
 //do my work here
});

```


It's perfectly acceptable for Closure to give you as much access to the raw request as possible, but I'm seriously at a loss why it doesn't ship with a more accessible API for developers coming from jQuery/Prototype/MooTools/etc background. Something like this would do fine:

```javascript
goog.net.SimpleXhr = function(options) {
 goog.net.XhrIo.call(this);
 for (var event in options.events) {
   goog.events.listenOnce(this, event, options.events[event]);
 }

 request.send(options.url, options.method);
});

goog.inherits(goog.net.SimpleXhr, goog.net.XhrIo);
```


This would give you an API very similar to jQuery:

```javascript
goog.net.SimpleXhr.new({
 url: 'http://mycompany.com',
 method: 'GET',
 events: {
   goog.net.EventType.SUCCESS: function() {
     //callback here
   }
 }
});

```


The DOM
-------

Closure gets another kick in the pants here. Closure only supports static helper methods to for developers to work with the DOM.

```javascript
var element = goog.dom.createElement('div');

goog.dom.appendChild(element, document.body);

```
vs

```javascript
$('<div />').appendTo(document.body);

```


It's not the extra line that bothers me. It's the lack of context and Context is King in my world.  
I constantly found myself second guessing things like,
"is the first argument to appendChild() the child or the parent element?"  
Calling methods directly on the DOM element is so much more natural than using
these external helper methods even if
[method chaining](http://draft.blogger.com/goog_1259040188124)
[does](http://draft.blogger.com/goog_1259040188124)
[have it's own drawbacks]({% post_url 2009-11-02-jquery-dom-manipulation-performance %}).


Dependencies/Libraries
----------------------

The require and provide functions are the right and left bauers that enable the [Closure Compiler](http://code.google.com/closure/compiler/) and the [dependency calculation script](http://code.google.com/closure/library/docs/calcdeps.html) do it's thang.


The goog.provide() method makes it ridiculously simple to namespace your code. It has always been a best practice to namespace your code so why wouldn't you use it?


The goog.require() function is pretty badass and solves a very common problem where you end up rolling all your javascript files into one bloated file. Have you ever seen the [PageSpeed plugin](http://code.google.com/speed/page-speed/) complain that "90% of the Javascript on this page has not been invoked"? Not any more! Only import what you need. The Closure compiler helps take this very slick solution for dynamic imports and makes it ready for production deployment. If only they had a similar solution for css!


Using require and provide definitely feels Java-ish, but I think it's a good thing! Explicitly declaring what your library provides and requires not only allows for "tooling support" (ex: the Closure compiler), but it also forces the developer to be aware of what they depend on and not to make any assumptions about what plugins the user will already have included on their page.


Components!
-----------

The number of widgets available is extremely impressive and each one is a great learning experience. Packaging executable demos along with the source is also extremely helpful to get started quickly. I've been very happy with my usage of jQuery plugins, but Google has definitely laid a strong foundation that third party widget developers should follow.



Testing
-------

Major props go to Google for including a robust test library with Closure.  -1 for using JSUnit. :)


After using screw unit and it's emphasis on "context" for testcases, the JSUnit pattern of "testMyFunctionDoesItsWorkWhenSetupInACertainWay" is a major turnoff.


The BlueRidge library might be able to take some pointers from Google. Using the Closure goog.require() method should be able to [fix it's lack of Safari support](http://github.com/relevance/blue-ridge/issues#issue/13).


In Conclosure
-------

The Closure library brings a lot to the table and is incredibly exciting for the world of Web developers. I can't wait to see the rippling impact some of the tools and techniques Closure introduces will have on the Web community. Closure is an incredible project that is pushing to show Javascript as a legitimate language, and squash the common opinion that Javascript is a "toy" language for wanna be web designers turned hackers. Make no mistake about it. Closure is built by engineers, for engineers.
