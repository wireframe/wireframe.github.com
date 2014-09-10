---
title: "Rspec Lintable Matcher"
tags:
 - testing
 - opensource
 - rails
 - javascript
---

Awhile back, I [released an Rspec matcher that validated controller responses returned linkable Javascript]({% post_url 2011-06-27-jslint-rails-javascript-responses %})
using the [JSLint library](http://jslint.com).

Today, I have the opportunity to resurrect that work and update it significantly
to work with the great [Jshint library](http://jshint.com).
The [rspec-lintable gem](https://github.com/wireframe/rspec-lintable) adds a
convenient `be_lintable` matcher for your controller specs to easily ensure
that your Javascript responses are syntactically valid.

```ruby
describe "#show" do
  before { get :show, format: :js }
  it { should be_lintable }
end
```

All options and configuration for the `be_lintable` matcher are done via
the standard [Jshint .jshintrc configuration file](http://www.jshint.com/docs/).

This matcher gives you a *whole lot* of bang for your buck.  It doesn’t
actually **exercise** the Javascript like a full integration test,
but in my experience, linting the response is a great smoke test that
actually catches quite a few issues that can break an end users browsers
(especially if they’re running IE).

Enjoy and send me any feedback if you have suggestions or issues!
