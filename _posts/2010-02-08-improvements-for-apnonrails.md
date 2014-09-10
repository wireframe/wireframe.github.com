---

title: "Improvements for apn_on_rails"
date: 2010-02-08
comments: false
tags:
 - rails
 - apple
 - opensource
---




If you're using Rails and integrate with Apple Push Notifications, you are more than likely familiar with the [apn\_on\_rails gem](http://github.com/markbates/apn_on_rails). It's a fantastic library and has been critical for getting off the ground with push notifications quickly. The project is [currently in flux](http://www.metabates.com/2009/12/21/apn-on-rails-needs-a-home/) and has been missing some critical features, so I decided to dig into the source myself and hack away.


Using [custom metadata to each push notification](http://developer.apple.com/IPhone/library/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/ApplePushService/ApplePushService.html#//apple_ref/doc/uid/TP40008194-CH100-SW15) was needed right off the bat. Basic push notifications support a "badge", "alert", and "sound", but custom attributes can be used to push metadata that would be useful for your native application. The original apn\_on\_rails plugin does not support custom attributes, but after building on the [work done by lmarburger](http://github.com/lmarburger/apn_on_rails), custom payload attributes are working great.


Truncation of alert text is another critical feature that needed some love. Apple limits push notifications to a maximum of 255 characters which includes the alert text and all custom attributes so it is very important to optimize the data you're sending down and not go over the 255 character limit. The initial gem used a very simple implementation for truncating the text, which worked fine until you started to push custom attributes as well. Those valuable characters got eaten up in a hurry and the truncation of the alert text needed to be aware of your entire payload length.


With a few hours of work, the entire truncation algorithm has been rewritten (with tests) and is working great. This new algorithm will dynamically truncate your alert text based on your entire payload body. This is a much better algorithm for text truncation and I've seen a 20% increase in the amount of text sent with push alerts before the truncation kicks in (average from 179 to 215 characters).


I also fixed a pretty major bug when truncating notifications with multibyte characters. Anyone using apn\_on\_rails for an internationalized app should definitely consider the update.


My fork of the original apn\_on\_rails gem is available [on github](http://github.com/wireframe/apn_on_rails) and the updated gem is published and available [on gemcutter](http://gemcutter.org/gems/wireframe-apn_on_rails).
