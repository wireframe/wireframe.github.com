---
layout: post
title: "Anatomy of an Effective Unit Test"
date: 2010-12-08
comments: false
categories:
 - testing
---

[](http://1.bp.blogspot.com/_yocpuDtbm4c/TQBR1QacfVI/AAAAAAAAABU/FqFtno1aIbE/s1600/doogietest.png)


Writing an effective and expressive unit test is just as important as writing clean application code. Unfortunately, there are not nearly enough resources for how to write good unit tests.


Dr. Sonnek is in the house today with a prescription.  Let's start by defining the "Anatomy of an Effective Unit Test".


Every single unit test should be composed of 4 parts: Description, Setup, Execution, Assertion.


To be perfectly clear, I'm not encouraging writing complex unit tests in any way, shape or form.  These 4 aspects of a unit test can, and should be, fulfilled in as few as 5 lines of code.  Each testing library will have a slightly different feel, but the majority of old school testing frameworks rely on procedural execution or conventions to express these rules (JUnit, JSUnit, TestUnit, etc).

```ruby
#this is teh old school way to write tests
#test description
def test_creating_blog_sends_email
  #setup
  user = User.create!

  #execute
  blog = user.blogs.create!

  #assert
  assert Mail.sent?
end
```


Several modern testing frameworks have introduced a clearer separation between these important aspects and use structural separation between setup/execution and assertion which makes it easier to scan tests and read what they are trying to accomplish. Here's a basic example, and I'll break down each section afterwards.


```ruby
#this is teh new hotness for writing tests
#describe the execution context (data, environment, etc)
context "creating blog post with new user" do
  setup do
    #setup
    user = User.create!

    #execute
    blog = user.blogs.create!
  end

  #assert
  should 'send email to author' do
    assert Mail.sent?
  end
end
```


I'll use shoulda syntax for these examples, but the same principles apply to RSpec, JSspec, etc.  Now, let's dive into the Anatomy of an Effective Unit Test...


### Description

Separating the setup/execution/assertions into separate blocks creates self documenting and highly readable tests.  The "description" component for each part of your test (setup, execute, assertion) is used to construct a sentence for your test.  This is a welcome change from the uglified test naming convention used by legacy test frameworks. The previous example would read:

"creating blog post with new user should send email to author"


### Setup

Test setup is used to initialize environmental or data dependencies before execution and assertion.  The description for your setup block should clearly describe these dependencies.

```ruby
context "with new user" do
  setup do
    @user = User.new
  end
end
```


### Execute

Execution is just another form of setup, and lives alongside other environmental or data setup.  The description for your execution context should match the method you are invoking and what parameters are being used for this particular invocation.

```ruby
context "creating blog" do
  setup do
    blog = @user.blogs.create!
  end
end
```


### Assert

One assertion per test. No more...no less. Old school unit tests very commonly have multiple assertions per test but Shoulda makes it super simple to encapsulate each assertion and re-use common setup/execution contexts.

```ruby
should 'send email to author' do
  assert Mail.sent?
end
```


Writing effective unit tests is never easy, but structuring your unit tests correctly and understanding the importance of each aspect should make your job just a little bit easier.