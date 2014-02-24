---
layout: post
title: "Multitenant Ruby Gem"
date: 2011-03-03
comments: false
tags:
 - ruby
 - multitenant
 - security
---



Multitenant: locking down your app and making cross tenant data leaks a thing of the past...since 2011


Designing multi-tenant applications has increasingly becoming the norm for software developers. The benefits of building an application with a multi-tenant architecture are almost too many to list (cost savings, data mining, simplified operations, etc). But, let there be no doubt that building a multi-tenant application increases the overall complexity of the application.


The [Multitenant gem](https://github.com/wireframe/multitenant) helps alleviate that complexity and ensures that all SQL queries executed adhere to the scoping of the current tenant. It works with any Rails3 compatible application without any modifications to your existing schema.


To configure, add the belongs\_to\_multitenant declaration to any model that has an association to a particular tenant.  This will inject a new SQL scope into your model.

```ruby
class User  belongs_to :tenant
  belongs_to_multitenant
end
```


Now, all queries executed within the Multitenant.with\_tenant block will automatically be scoped to the current tenant. No longer must you worry about a stray MyModel.all call exposing data to the wrong users! Also, any new records created within this block will automatically be associated to the current tenant. Another win for ensuring data separation!

```ruby
# use an Rails around_filter to setup this block
Multitenant.with_tenant current_tenant do
  # queries within this block are automatically
  # scoped to the current tenant
  User.all

  # records created within this block are
  # automatically assigned to the current tenant
  User.create :name => 'Bob'
end
```


Unintentionally leaking data between tenants should be the NUMBER ONE concern when building multi-tenant apps and it surprises me how few resources are available to assist developers in building multi-tenant apps and ensuring data separation between tenants. So, if you're building a multi-tenant Rails app, make sure the [Multitenant gem](https://github.com/wireframe/multitenant) is in your toolbox!


Source code is 100% opensource and available on Github:

[https://github.com/wireframe/multitenant](https://github.com/wireframe/multitenant)


Gem is available on rubygems:

[https://rubygems.org/gems/multitenant](https://rubygems.org/gems/multitenant)
