---
layout: post
title: "Zillow Google Chrome Extension"
date: 2010-03-22
comments: false
categories:
 - chrome
 - zillow
---

Incase you haven't heard, [I love]({% post_url 2010-02-07-mailinator-google-chrome-extension %})
[me some]({% post_url 2009-12-16-delicious-google-chrome-extension %}) Google Chrome extensions.
And now [the Zillow Google Chrome extension](https://chrome.google.com/extensions/detail/hpfpmhoefhblnbnipeapenjojpcbifpo/) just made looking for a new house a heck of a lot easier.

Grab an address, pop open the Zillow Google Chrome extension and find the estimated property value in no time!


The Zillow Google Chrome extension is a mashup using
[the Google Maps API](http://code.google.com/apis/maps/documentation/v3/introduction.html) and
[the Zillow API](http://www.zillow.com/howto/api/GetZestimate.htm) to quickly find
as much detail about a property while avoiding the cluttered and slow ass real-estate websites.
Consider this the "official" successor to my
[original Zillow Ubiquity plugin]({% post_url 2009-03-04-zillow-ubiquity-plugin_04 %}).
Ubiquity was cool but this extension is the cat's meow!


The Zillow Google Chrome extension shows the estimated property value along with the estimated high/low range value.  A direct link to the detailed estimate on Zillow is also available if you want more information about the property.


The property location is displayed with an embedded Google map along with a direct link to a full property map to dive into the street view (on Google Maps of course).  Using Google's geolocation service also makes it possible to quickly find a location even if you don't know the full address!


The [code is 100% opensource and available on github](http://github.com/wireframe/zillow-chrome-extension) and here are a few ideas for future improvements. fork away!

  - an extension browser action could detect when the user selects an address on the page
  - prefill the popup address based on the user selected address on the page
  - hovering over address could display an inline popup bubble with the estimate information

