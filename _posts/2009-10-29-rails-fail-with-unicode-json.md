---

title: "Rails Fail with Unicode JSON"
date: 2009-10-29
comments: false
tags:
 - rails
---



How to break nearly any Rails app using JSON in 3 simple steps
-----------------


  1. Store unicode characters in the database (\020 or \221 or pretty much any other unicode character)
  2. Request JSON representation of data
  3. Watch your clients crash and burn (IE7 and PHP parsers in particular will hack and die on the JSON response)


Here's a quick testcase to show the issue. Fire up your script/console to try it out:

```ruby
'bad characters'.concat(16).to_json => ""bad characters\020""
```


Notice anything special about the rendered string? How about the fact that it's invalid JSON?!? Unicode characters need to be escaped, and the proper response should be:

```ruby
#=> ""bad characters\u0010""
```


The most common way I've seen these unicode characters get into the database is when someone copies text from a word document and pastes it into my application. It's not extremely common, but that's no excuse for rendering invalid responses.


The [ruby json gem](http://json.rubyforge.org/) encodes the unicode characters correctly and the Rails implementation is pretty busted. Rails has a pluggable backend for parsing JSON (ActiveSupport::JSON.backend), so why not delegate the ActiveSupport::JSON.encode method to the same implementation?


Please vote for this lighthouse ticket to get JSON encoding in Rails up to snuff!

[https://rails.lighthouseapp.com/projects/8994/tickets/3345-to\_json-does-not-escape-unicode-characters#ticket-3345-1](https://rails.lighthouseapp.com/projects/8994/tickets/3345-to_json-does-not-escape-unicode-characters#ticket-3345-1)


**UPDATE:** A patch has been [submitted and accepted](http://github.com/rails/rails/commit/a9002056761a481589852d6e8680f752a5b823b7) into the rails core that should fix this issue with the next release. Hopefully this doesn't have to wait till the Rails 3.0 release!
