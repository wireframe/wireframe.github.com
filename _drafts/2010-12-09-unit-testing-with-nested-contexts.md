---
layout: post
title: "Unit Testing with Nested Contexts"
date: 2010-12-09
comments: false
tags:
 - testing
 - ruby
---

Nesting contexts and assertions is a more advanced and incredibly powerful aspect of several modern unit test frameworks (shoulda, jspec, etc). It is both a blessing and a curse. Using context nesting in most situations is a great way to reuse common data or environmental setup, but it must be applied judiciously to keep tests from getting out of control.


Here's a very basic example using Shoulda. The parent context is a simple environmental setup that can be reused for multiple tests...

```ruby
context "when user is logged in" do
  # setup data
  setup do
    @user = User.new
    login_as @user
  end

  # execute (within the scope of the previous setup)
  context "get home page" do
    setup do
      get :home
    end

    #assert
      should redirect_to('/activate')
    end
  end

  # execute (within the scope of the *parent* context)
  context 'get help page' do
    setup do
      get :help
    end
    should redirect_to('/activate')
  end
end
```


The context descriptions are particularly important when nesting since context contributes a substring of your complete assertion. For example, the previous test reads as:

"when user is logged in, get home page should redirect to /activate"

"when user is logged in, get help page should redirect to /activate"


### Complexity of Nested Contexts

Using nested contexts does increase your test complexity and heavily nested contexts can be ridiculously difficult to read. If your tests begin nesting several levels of setup, you can easily lose track of what your execution context is when writing tests.


There is a very compelling argument for restricting nested contexts and collapsing multiple setups into one verbose setup block. A good rule of thumb is that if the concatenated contexts no longer make a humane understandable sentence, it's time to refactor the test.


```ruby
context "when user is logged in" do
  #setup used for all nested contexts...
  setup do
    @user = User.new
    login_as @user
  end

  context "and the user's timezone is EST" do
    #more setup...
    setup do
      @user.timezone = 'EST'
    end

    #execute...umm...what scope am i actually running in?
    context 'get home page' do
      setup do
        get :home
      end

      should redirect_to('/activate')
    end
  end
end
```

By inlining the nested blocks, this test becomes:

```ruby
#setup and execute (note the more verbose description)

context "get home page when user is logged in and user's timezone is EST" do
  setup do
    @user = User.new
    login_as @user
    @user.timezone = 'EST'
    get :home
  end

  should redirect_to('/activate')
end
```
