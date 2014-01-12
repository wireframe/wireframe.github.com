---
layout: post
title: "Bundler Reorganizer"
categories:
 - ruby
---

[Bundler groups](http://bundler.io/v1.5/groups.html) are an incredibly useful feature for managing dependencies of your ruby project.
Keeping your Gemfile organized can be a challenge and it's all too easy to accumulate
stray inline group declarations over time that would be better served with the block-style syntax.

The [bundler-reorganizer](https://github.com/wireframe/bundler-reorganizer) gem is now available
to get your Gemfile back in shape!  One simple command turns your **unwieldy** Gemfile from this:

```ruby
gem "utils", :group => :development
gem "more-tools", :group => :development
gem "testsuite-runner", :group => [:development, :test]
```

Into this!

```ruby
group :development do
  gem "utils"
  gem "more-tools"
end

group :development, :test do
  gem "testsuite-runner"
end
```

Getting up and running with bundler-organizer is as simple as:
```bash
$ gem install bundler-organizer
$ bundler-reorganizer path/to/Gemfile
```

That's all there is to it.  The command is 100% re-runnable, so you can re-prettify your Gemfile
from time to time as necessary.

[Suggestions, feedback and patches](https://github.com/wireframe/bundler-reorganizer) are always welcome!
