---

title: "Continuous Deployment for Rails"
date: 2009-09-15
comments: false
tags:
 - ruby
 - process
 - lean_startup
 - rails
 - testing
---

It's literally been months since I've manually typed "cap production deploy". For the past several months, we've been implementing a [lean startup process](http://www.startuplessonslearned.com/) and using continuous deployment to push code to production. Continuous deployment's core premise is to deploy code to production with every commit. From my standpoint, it's been a dream come true.




Just Ship It!


The theory behind continuous deployment is rather simple, "unreleased code is a liability". Features that takes weeks to build without getting real feedback are distracting you from focusing on what your customers are seeing every day. Using continuous deployment forces you to think differently about feature development. Large complex features become incremental deployments with user feedback at each step to ensure you're headed in the right direction (and to pull the plug as quickly as possible if you're not). If you're able to adjust your feature during the development cycle, you save time (and money) that would be wasted on going in a wrong direction.


Effective and thorough testing are all that stands between a bad commit and a busted production environment, which means that continuous integration is absolutely critical. The Testing Nazi in me taken full advantage of this to push the envelope on the importance of testing.  I've even hired a set of angry midgets to enforce proper testing standards...




If it's not tested, it's CRAP!


[Cruisecontrol.rb](http://cruisecontrolrb.thoughtworks.com/) is the heart and soul of our continuous deployment, but it's actually a very simple process. We register a custom rake task which runs our complete testsuite and if all tests pass, cruisecontrol flips the switch and deploys the code. Our rake task looks something like this:

```ruby
#lib/tasks/cruisecontrol.rake
desc 'Run all continuous integration tests'
task :cruise do
 #run all tests
 #see rails/lib/taks/testing.rake
 errors = %w(units functionals integration javascripts acceptance).collect do |task|
   begin
     Rake::Task["test:#{task}"].invoke
     nil
   rescue => e
     task
   end
 end.compact

 abort "Errors running #{errors.to_sentence(:locale => :en)}!" if errors.any?
 system "cap production deploy"
end
```


Our testsuite started off as a standard rails deployment and has grown over time to accommodate our evolving testing practices. Building a modern Web 2.0 application means you'll be spending a lot of time dealing with web browsers, so we've spent extensive time integrating tools for testing web browsers and javascript. Our current testsuite includes:

  - unit tests (Test::Unit)
  - functional tests (ActionController::TestCase)
  - integration tests (ActionController::IntegrationTest)
  - javascript tests ([BlueRidge](http://github.com/relevance/blue-ridge/tree/master)/[ScrewUnit](http://github.com/nkallen/screw-unit))
  - acceptance tests ([Selenium](http://seleniumhq.org/))

It's important to remember that you shouldn't go overboard building out infrastructure to support a continuous deployment process. The same rule of "undeployed code is a liability" applies to your testing environment. You absolutely can not afford to waste time building out a suite of tools until you need it. Simply take incremental steps from where you are today and slowly add in infrastructure as needed. Each step will incrementally move you towards a better system overall.
