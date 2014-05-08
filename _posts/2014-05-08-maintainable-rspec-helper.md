---
layout: post
title: "Maintainable RSpec Helper"
tags:
 - testing
 - ruby
---

[RSpec](http://rspec.info/) is a great testing library and there are are literally
a **ton** of useful libraries that integrate with your RSpec test suite.
Within a few minutes of bootstraping a new RSpec test suite, I typically add
in a standard set of gems for enhanced productivity
(ex: [factory_girl](https://github.com/thoughtbot/factory_girl),
[webmock](https://github.com/bblimke/webmock), [vcr](https://github.com/vcr/vcr),
[timecop](https://github.com/travisjeffery/timecop), etc).

The vast majority of libraries are straightforward to integrate into your project,
and only require a few steps:
1.  add the gem to your `Gemfile`
2.  require the library in your `spec/spec_helper.rb`
3.  *[optional]* configure the library as necessary

It doesn't take long for your nice concise `spec_helper.rb` file to mutate into a
bloated, monolithic list of require statements and snippets of configuration code
for each library.  There are some [*awesome* monstrosities out there for review](https://github.com/badeball/formtastic-pure/blob/32c4c254b183bdf5d0b1b28d5861e6e104694949/spec/spec_helper.rb).

## How do we unwind this mess?

[Rails has used `config/initializers`](http://guides.rubyonrails.org/configuring.html)
as a simple and elegant way to avoid globbing all of your configuration
into your application.rb file.  Can we apply a similar pattern to RSpec?

Guess what?! RSpec **already** has this pattern built in!  
The `spec/support` directory is a magic directory that RSpec automatically
loads into your test suite and is essentially equivalent to `config/initializers`!  
By default, every spec_helper.rb file is generated with this one little hook
to make the magic happen.

```ruby
# spec/spec_helper.rb

# this line loads all your ruby files from spec/support
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
# BOOM!
```

So, the next time you add a new gem to your test suite, resist the temptation
to modify your `spec_helper.rb` and create a *new file* in `spec/support` instead!
Perform your standard `require` statement and any relevant configuration in it's
own file and avoid polluting your main `spec_helper.rb`.

Here's a simple example to load and configure the [VCR gem](https://github.com/vcr/vcr)
into your RSpec environment.

```ruby
# spec/support/vcr.rb
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end
```
Enjoy the organizational *#protip* and drop me a line if you have any other
tips or tricks!
<p class="text-center">
![Keep Calm and Extract Code]({{ site.url }}/images/KEEP_CALM_AND_EXTRACT_CODE.png)
</p>
