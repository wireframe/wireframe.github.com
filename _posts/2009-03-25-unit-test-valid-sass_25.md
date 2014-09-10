---

title: "Unit Test Valid SASS"
date: 2009-03-25
comments: false
tags:
 - testing
 - css
---

How do you ensure that hacker developers like myself don't check in invalid SASS?  I can't count the number of times I've checked in that "one tiny change", that ended up breaking the layout of a page.



Continuous integration is obviously the best solution available, and here's a test you can use in your application to ensure that all of the SASS will compile to valid CSS files.



```ruby
require File.dirname(__FILE__) + '/../test_helper'

class SassTest  
  def test_valid_sass
    run_cmd('rake sass:generate_css')
  end

  private

  def run_cmd(cmd)
    puts "\nRunning: #{cmd}"
    assert system(cmd), "#{cmd} failed"
  end
end
```
