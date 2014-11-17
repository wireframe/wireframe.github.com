---
title: "Best Practices for testing Rails controllers with RSpec"
tags:
 - rails
 - testing
 - protip
---

Rails is primarily a web development framework and so it is natural that controllers are an integral aspect of your application.  Controllers in Rails typically accept HTTP requests as their input and deliver back and HTTP response as output.  This is a pretty important part of building web applications, and so unit testing your controllers should be one of the most fundamental parts of your testsuite.  I'm a huge fan for RSpec for testing Rails applications, and I've found that although the rspec-rails gem is a great starting point, there is a general lack of best practices for how to properly unit test controllers.

## Essential assertions

Let's start with the basics.  **What should you test?**  The output of Rails controllers is the HTTP response, and so it is **essential** that each controller action has tests that assert the core HTTP response properties.  For example:

* What was the response status code?
* What was the response content type?
* Did the controller render the expected template?
* Did the controller render the expected Rails layout?
* Did the controller set any flash messages?
* Was any information inserted or deleted from the session?
* Did the controller redirect the user to a new URL?

Luckily, most of these assertions are a one-liner thanks to the excellent [shoulda-matchers gem](https://github.com/thoughtbot/shoulda-matchers).

## Structured contexts

Using RSpec contexts effectively are a critical aspect of writing great controller specs.  [Betterspecs.org](http://betterspecs.org/#describe) does a good job providing the basics, and here are some additional tips that apply specifically to controller specs which will help make your tests *much* more expressive.

*NOTE: The setup and assertion blocks (before/it) have been left blank as an exercise for the reader.  The implementations should be very straightforward and were omitted to emphasize the structure/language used to scaffold the context blocks.*

#### Input permutations

Create a new context for each set of *meaningful* inputs.  Typically this is used for varying query parameters, but it also works well when you need to exercise code paths for HTTP session or header usage.

```ruby
describe 'GET #index' do
  context 'when params[:filter_by] == first_name' do
    it 'filters results by first_name'
  end
  context 'when params[:filter_by] == last_name' do
    it 'filters results by last_name'
  end
end
```

#### Valid vs invalid params

Same principle as the previous tip, but worth calling out again with more direct mention since it is such a common usecase.

```ruby
describe 'POST #create' do
  context 'with valid params' do
    it 'redirects to show page'
  end
  context 'with invalid params' do
    it 're-renders #new form'
  end
end
```

#### Authenticated access

Use separate contexts for authenticated vs un-authenticated access.

```ruby
describe 'GET #index ' do
  context 'when user is logged in' do
    it 'renders the listing page'
  end
  context 'when user is logged out' do
    it 'redirects to login page'
  end
end
```

#### Authorized access

Create a new context for each user role accessing the endpoint (ex: admin vs standard user).

```ruby
describe 'GET #show' do
  context 'as content owner' do
    it 'renders the permalink template'
  end
  context 'as an admin' do
    it 'renders the permalink template'
  end
  context 'as a guest user' do
    it 'displays access forbidden message'
  end
end
```

#### Avoid nested contexts

Do not nest contexts in order to share common setup.  Just don't.  **Ever**.

*This deserves an entire blog post of its own and will be a topic of future discussion...*

## Controllers should render templates

Now, here's a gotcha with the RSpec-Rails integration.  For some reason, the default RSpec-Rails configuration disables rendering of templates for controller specs.  In my opinion, This is a very poor recommendation that leads to a false sense of security.  I've seen this happen more than once where your controller tests will pass, your code coverage will be 100%, but like a HAML indentation issue will blow up in production.  **BOOM**.

Rails controllers operate on HTTP requests and **the response body is a critical part of it's job**.  To fix this, make sure to enable the `render_views` setting in your rails_helper.rb file.
https://github.com/rspec/rspec-rails#controller-specs

```ruby
RSpec.configure do |config|
  config.render_views
end
```

I *do* encourage the use of view specs when a view has conditional codepaths, and I also recommend using integration/request specs when it is necessary to test Rack middleware, but it is unnecessary to write these extra specs for every single controller action and view.  Why force developers to write separate integration tests that duplicate over 90% of your standard controller spec when I can simply render the views within controller specs and be done with it?  I'm all for separation of concerns, but this is a simple matter of pragmatism vs dogma.

And, if there was a way to [detect the code coverage of views](https://github.com/colszowka/simplecov/issues/38), I actually would enjoy having controllers not perform this rendering call and could rely entirely on view specs.  That way, any unrendered code paths in views could be caught by continuous integration processes.  Until that is possible, I find it much safer to enable rendering by default and allow for specific controllers to opt-out of rendering if necessary.

## Complete example

And here is a simple example for a controller action with structured contexts and the bare minimum expected assertions.  Enjoy!

```ruby
describe PostsController do
  describe 'GET #index' do
    context 'when user is logged in' do
      with :user
      before do
        sign_in user
        get :index
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :index }
    end
    context 'when user is logged out' do
      before do
        get :index
      end
      it { is_expected.to redirect_to new_session_path }
      it { is_expected.to set_the_flash(:warning).to('Please log in.') }
      it { is_expected.to set_session(:return_to).to(posts_path) }
    end
  end
end
```

*NOTE: the RSpec `with` helper method comes from the handy [factory\_girl\_rspec gem](https://github.com/wireframe/factory_girl_rspec) and the `respond_with_content_type` matcher from the [shoulda-kept-respond-with-content-type gem](https://github.com/tinfoil/shoulda-kept-respond-with-content-type).*
