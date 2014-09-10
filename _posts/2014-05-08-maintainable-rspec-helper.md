---
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

It doesn't take long for your nice concise `spec_helper.rb` file to evolve into a
bloated, monolithic list of require statements and snippets of configuration code
for each library.  My eyes bleed everytime I run across a file [like this](https://github.com/badeball/formtastic-pure/blob/32c4c254b183bdf5d0b1b28d5861e6e104694949/spec/spec_helper.rb).

## How do we unwind this mess?

[Rails has long used `config/initializers`](http://guides.rubyonrails.org/configuring.html)
as a simple and elegant way to extract snippits of configuration code into their
own files and avoid globbing everything into one massive `config/application.rb`
file.  Can we apply a similar pattern to RSpec?

Guess what?! RSpec **already** has this pattern built in! The `spec/support`
directory is automatically loaded by RSpec and is essentially equivalent to
`config/initializers`!  

Here's a simple example for how to load and configure the [VCR gem](https://github.com/vcr/vcr)
into your RSpec environment **without** modifying your `spec_helper.rb` file.

```ruby
# spec/support/vcr.rb
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end
```

## Under the Covers

How does RSpec actually do it?  There's no real magic to it at all.  By default, every
`spec_helper.rb` file is generated with this one hook that automatically loads
all Ruby files within the `spec/support` directory.

```ruby
# spec/spec_helper.rb

# this line loads all your ruby files from spec/support
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
# BOOM!
```

So, the next time you add a new gem to your test suite, resist the temptation
to modify your `spec_helper.rb`.  Instead, create a *new file* in `spec/support`
and perform your standard `require` statement and any relevant configuration there!

Enjoy the organizational *#protip* and drop me a line if you have any other tricks!
<p class="text-center">
![Keep Calm and Extract Code]({{ site.url }}/images/KEEP_CALM_AND_EXTRACT_CODE.png)
</p>
