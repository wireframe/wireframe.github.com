---
layout: post
title: "Jasmine Dynamic Fixtures"
tags:
 - testing
 - rails
 - javascript
 - opensource
---

How many times has this happened on your team...

1.  A Javascript test relies on a chunk of static HTML markup modeled after the actual
markup used within your application.  The [jasmine-jquery](https://github.com/velesin/jasmine-jquery) library
makes this simple and straightforward.
2.  Another developer/designer changes the HTML markup within the **application**,
but forgets to update the static test HTML fixture used by the **testcase**.
3.  The Javascript test suite does *not* detect the regression. Your tests
continue to pass since they are loading a static HTML fixture that is now out of sync
with the actual markup used in your app.
4.  Bugs are released to production and your Javascript no longer works as expected.

It’s a simple mistake that is 100% preventable if your Javascript test suite
could **re-use the same markup for both the real application and the relevant tests**.
The recent [jasmine-rails release](https://github.com/searls/jasmine-rails/pull/90) now includes
an elegant way to get rid of those fragile static HTML fixtures and leverage the markup used
within your application!

The JasmineRails `save_fixture` helper method can be used within any Rspec controller or view
test to safe off HTML fixtures that can later be re-used by your Jasmine test suite.  This assumes of course
that your runs Rspec **before** Jasmine.

```ruby
require 'spec_helper'

describe 'users/show.html.haml' do
  before do
    render
  end
  it 'saves html fixture for Javascript specs' do
    save_fixture 'users/show.html'
  end
end
```
After your Rspec test suite completes, these fixtures are saved to the `spec/javascripts/fixtures/generated`
directory.  The `spec/javascripts/fixtures` directory can still be used for any static fixtures used by your application and the dynamic *generated* fixtures will be overwritten every time you run the Rspec tests.
The generated fixtures are also automatically ignored by Git, so you don’t need to worry about
polluting your project repository.

```
spec/javascripts/fixtures/
├── generated
│   └── users
│       └── show.html
└── static_fixture.html
```

These dynamically generated fixtures can now be loaded by your Jasmine specs with
the [jasmine-jquery](https://github.com/velesin/jasmine-jquery) library by tweaking the path used by
the `loadFixtures` call.

```javascript
describe('users/show.js', function() {
  'use strict';
  beforeEach(function() {
    loadFixtures('generated/users/show.html');
  });
  it('loads generated HTML fixtures', function() {
    // assert something here
  });
});
```

This solution has been a huge success for our team, and has successfully caught **several**
regressions by our standard continuous integration process (and **not** by our customers).
