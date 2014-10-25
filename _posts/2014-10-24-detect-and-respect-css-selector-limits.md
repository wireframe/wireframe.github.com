---
title: "Detect and Respect CSS Selector Limits"
tags:
 - opensource
 - ruby
 - rails
 - css
 - testing
 - protip
---

> Old IE continues to cause the world pain...

Incase you didn't know, IE8 and IE9 are pretty horrible web browsers.  They
have a *significant* flaw where they [can not render webpages if a single stylesheet has more than 4095 selectors](http://blogs.msdn.com/b/ieinternals/archive/2011/05/14/10164546.aspx).
This issue affects *all* Microsoft browsers until IE10.  Wow.

Unfortunately, these terrible browsers [*still* represent over 8% of the worlds internet traffic](http://gs.statcounter.com/#browser_version_partially_combined-ww-monthly-201309-201409),
and may need to be supported for certain projects.  So, what is the easiest
way to keep your site compatible with these old versions of IE without driving
you mad?

I've explored several tools to automate splitting a single large stylesheet
into smaller ones to avoid hitting this limit including [blesscss](http://blesscss.com/),
[css_splitter](https://github.com/zweilove/css_splitter), and [home rolled scripts](https://gist.github.com/ChristianPeters/2398394)
but I haven't found any of them to be a real home run.  Each solution is
fairly complex in nature which makes sense given the problem at hand.
Unfortunately, that complexity also makes for painful debugging when things go
wrong. At the end of the day, I would prefer to simply be *notified* when
my CSS files breach the selector limit, and then fix the issue manually by
splitting the files into logically related files (ex: application styles vs
admin styles).

This is a great usecase for a unit tests and I recently released the [rspec-respect\_selector\_limit gem](https://github.com/wireframe/rspec-respect_selector_limit)
which contains a reusable matcher for asserting that your stylesheets won't
break old IE.  It's a simple tool to integrate into your existing Rspec
testsuite like so:

```ruby
it 'ensures application.css does not break old IE' do
  expect('application.css').to respect_selector_limit
end
```

For applications that already have multiple stylesheets, the `rspec-respect_selector_limit`
gem has an additional helper to assert that **all** of your precompiled CSS files
meet the limitations of old IE.

```ruby
it 'ensures all configured CSS files do not break old IE' do
  expect(precompiled_css_files).to respect_selector_limit
end
```

This is a simple solution that keeps me in control of when to split out new stylesheets,
and as always contributions are welcome!
