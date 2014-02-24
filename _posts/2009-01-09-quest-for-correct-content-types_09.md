---
layout: post
title: "The Quest for Correct Content Types"
date: 2009-01-09
comments: false
tags:
 - ruby
---

[Attachment Fu is a kick ass rails plugin](http://github.com/technoweenie/attachment_fu/tree/master%20) for handling file uploads within your rails application.  It greatly simplifies the ordeal of supporting file uploads and even supports some really amazing features like using Amazon S3 as a backend to store your files.  My only gripes thus far have been finicky thumbnail generation...


_**And**_correct detection of the file content type...


I'm using a [flash widget for file uploads](http://developer.yahoo.com/yui/uploader/%20) in my app and it's been a pretty good solution except for the fact that flash kind of "forgets" to send the file content type to the server. _Oooppps_!  You see, browsers are responsible for including the content type when they post the file to the server and not having the correct content type causes all sorts of funky issues when the file is downloaded.  For example, a MS Word document will open with the wrong application if you don't have the correct content type.


Since [web browsers are not exactly any more trustworthy than flash](http://swfupload.org/forum/generaldiscussion/166%20)_*cough* IE *cough*_, it would be prudent to have the server do it's best to detect and/or correct the mime type sent by the client browser.  This led me to create [a fork of the attachment\_fu project](http://github.com/wireframe/attachment_fu%20) and improve the support for determining content types if/when the browser was unable to do so.


My solution is to determine the file content type by checking a chain of different mime type decision points.  First and foremost, the content type from the browser is used if available. If one is not given, or if the browser is unable to determine the content type, a series of fallback implementations try to reconcile the issue.


The first fallback is to rely on the file extension to lookup the mime type.  This is a very simple and flexible solution that allows for easy addition/customization of accepted mime types. Registering new mime types in rails is a snap, and this solution was necessary for me to support the new ms office 2007 document types.


Using the unix 'file' command to detect the content type is the next fallback.  This solution inspects the contents of the file to determine the file type.  It works relatively well except for when file contents are not necessarily unique.  For example, [all ms-office documents are reported as application/msword due to the file contents being nearly identical](http://www.mediawiki.org/wiki/Manual_talk:Mime_type_detection%20).


If all else fails, we simply set the content type to "application/octet-stream" which basically means "unknown binary data".




```ruby
# example code for the implementation.
# real code available at github
def uploaded_data=(file_data)
 default_mime_type = 'application/octet-stream'
 browser_content_type = (file_data.respond_to?(:content_type) ? file_data.content_type : file_data['content_type']).to_s.strip
 browser_content_type = nil if browser_content_type.blank? || browser_content_type == default_mime_type
 self.content_type = browser_content_type || file_extension_content_type || native_content_type || default_mime_type
end


# uses the os’s “file” utility to determine the file type, yanked and modified slightly from file_column.
# see http://blog.vixiom.com/2007/12/28/hacking-attachment_fu-to-work-with-flashflex-uploads-and-crop-square-images/
def native_content_type
 begin
   #mac osx uses -I instead of -i
   file_flags = (RUBY_PLATFORM.index('darwin') ? '-bI' : '-bi')
   file = File.join(temp_path)
   content_type = `file #{file_flags} "#{file}" 2> /dev/null`.chomp
   return nil if content_type.blank? || !$?.success?
   content_type.gsub!(/;.+$/,"")
 rescue
   nil
 end
end

# determine the content_type based on the file extension.
def file_extension_content_type
 types = MIME::Types.type_for(self.filename)
 types.empty? ? nil : types.first.content_type
end
```

I've been using this solution in my app for the past several months and have been very happy with the results.  Leave me any comments if you have other ideas/suggestions for improvements!

