---

title: "Zillow Ubiquity Plugin"
date: 2009-03-04
comments: false
tags:
 - zillow
 - ubiquity
 - opensource
---

Let's face it.  The majority of house hunting websites out there suck.  They're slow, unusable and more often than not, make me want to put my head through a window.

[Zillow.com](http://www.zillow.com) is the first real estate website I've come across has a very compelling user experience complete with all the flashy web 2.0 features I've come to expect (especially mapping).

Unfortunately, I don't currently have the ability to manage everything I need in Zillow, so I find myself flipping back and forth from real estate listing sites into Zillow.  I finally had enough and decided to whip up a Ubiquity command to integrate with the Zillow API.  This allows me to keep cruising on my current website, and mash up the great estimation features of Zillow.

 Here's how it works.

1.  Install the [Zillow Ubiquity command available on github](http://gist.github.com/74198).

2. Search the web for a property that interests you.

3. Highlight the address that you want to inquire about.


4. Invoke the Zillow Ubiquity command.

 

Voila!  Now you have access to the property estimated value while keeping you in the flow of browsing your current site.

 As an added bonus, you can open up the Zillow page for that property by pressing enter on the Ubiquity preview window.

 

One drawback of the current implementation is that the Zillow API is very picky about passing an address with a zip code.  Ideally, I could use a mashup with google maps to decipher the zipcode without forcing the user to enter one.  Any suggestions would be helpful!


