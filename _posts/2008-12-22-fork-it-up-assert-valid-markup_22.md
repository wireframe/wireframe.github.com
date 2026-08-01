---

title: "Fork it up - assert valid markup"
tags:
- ruby
- testing
- open-source
---

Unit testing view layers has always been a difficult problem for me.  I haven't run across a lot of libraries that I've found valuable, mainly because they're too slow.  I've found that no matter how good the tests are, if they're slow, they don't get run.

I was pretty excited when I ran across the [assert\_valid\_markup plugin](http://github.com/wr0ngway/assert_valid_markup/tree/master) which allows me to unit test that my pages are xhtml compliant.  It's wicked fast because it relies on locally installed binaries (xmllint), but it also has a nice fallback to use the w3c xml validation service.

The syntax for the plugin is very slick and doesn't require any unnecessary setup.

```ruby
class FooControllerTest  assert_valid_markup :index, :show

end

```
I've been using this plugin for about a month, and ran across a pretty major issue today when running my unit tests on our continuous integration server (Cruisecontrol).   All tests ran great on my local instance, but tests were failing in our shared environment with some very cryptic error messages.

```text
no such file to load -- FileUtils
/usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in
`gem_original_require'
/usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in
`require'
/usr/local/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/dependencies.rb:153:in
`require'
/usr/local/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/dependencies.rb:521:in
`new_constants_in'
/usr/local/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/dependencies.rb:153:in
`require'
/home/eventrobot/.cruise/projects/socialcast/work/vendor/plugins/assert_valid_markup/lib/assert_valid_markup.rb:5
/usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in `gem_original_require'
```
After digging through the plugin source code, I did what any inquisitive developer would do, **FORK IT UP**! [A small change](http://github.com/wireframe/assert_valid_markup/commit/637088fbd8ff8d1d507a8d07403ca92e04b9a684) to the plugin and I was back up and running...almost.  Another issue cropped up when running the tests through Cruisecontrol.

```text
/usr/local/bin/ruby -Ilib:test
"/usr/local/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake/rake_test_loader.rb"
/usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in
`gem_original_require': no such file to load --
active_support/breakpoint (MissingSourceFile)
from
/usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in
`require'
from
/usr/local/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/dependencies.rb:153:in
`require'
from
/usr/local/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/dependencies.rb:521:in
`new_constants_in'
from
/usr/local/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/dependencies.rb:153:in
`require'
from ./vendor/plugins/ez-where/test/test_helper.rb:6
```
Tracking down this issue was a real pain.  I spend the majority of my afternoon banging my head against the wall, but [I eventually tracked it down](http://github.com/wireframe/assert_valid_markup/commit/5883b603b5cf6381fc75364756d496f30c886cdf).  Tests are now up and running, and I have a github project with all of my fixes available for anyone to check out.  I'm still not 100% clear on the differences between my local environment and cruisecontrol, but that's for another time.

I may take this fork a bit further and turn it into a ruby gem instead of a rails plugin.  It seems better suited that way now that I ripped out the rails initializer code.

