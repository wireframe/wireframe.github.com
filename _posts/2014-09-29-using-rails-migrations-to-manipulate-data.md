---
title: "Using Rails Migrations to Manipulate Data"
tags:
 - rails
 - ruby
 - database
 - protip
---

[Rails migrations](http://guides.rubyonrails.org/migrations.html) were originally designed for manipulating **database schemas**.  Adding tables, columns and indexes are all usecases that are incredibly well supported and even supports more advanced features like rolling back to previous schema state.  Manipulating **production data** is also a common occurrence for developers, but how do you do that in Rails?


Importing data from flat files, updating records, and cleaning up records in a bad state are regular events.  Many developers would tackle these tasks by popping up the Rails console on a production server and manually running a few commands to take care of business.  You can accomplish all of these tasks using Rails migrations which is **significantly** less risky than giving every developer direct access to your database to [run one-off scripts live on your production data](http://codingsanctum.com/wp-content/uploads/2011/11/doitlive.jpg).  Using migrations also provides easy access to feature branch code reviews and even [unit testing](http://blog.carbonfive.com/2011/01/27/start-testing-your-migrations-right-now/).

Here are a few protips I recommend when building your Rails data migrations:

## Log all the things

Many schema migrations have a clear path for reverting if anything goes wrong, but data migrations are **much** more challenging to revert.  It is absolutely **essential** for your migrations to provide as much debug information as possible for if/when anything goes wrong.

Here's a simple example that highlights using the [`say_with_time` helper](http://rails-bestpractices.com/posts/46-use-say-and-say_with_time-in-migrations-to-make-a-useful-migration-log) for auditing how long a migration step took and how many records were affected.  **Make sure to return the number of affected rows within the block**!


```ruby
def UpdateInvalidUsers < ActiveRecord::Migration
  def up
    say_with_time "Updating invalid users..." do
      count = 0
      User.find_each do |user|
        say "Updating user: #{user.id}"
        user.update!(status: 'valid')
        count += 1
      end
      count
    end
  end
end
```

## Audit state pre and post execution

Logging *during* execution of a migration is simple enough, and it's also very helpful to log information before execution about the current state of the system.  For example, logging the number of invalid records **before** the migration begins is a great data point.

A good data migration should also assert that the operation completed successfully and raise an error if something did not complete as expected.

Taking our previous example, here is an expanded version that adds in simple pre and post execution logging plus assertions.


```ruby
def UpdateInvalidUsers < ActiveRecord::Migration
  def up
    say "Found #{User.where(status: 'invalid').count} invalid records"

    say_with_time "Updating invalid users..." do
      count = 0
      User.find_each do |user|
        say "Updating user: #{user.id}"
        user.update!(status: 'valid')
        count += 1
      end
      count
    end

    invalid_count = User.where(status: 'invalid').count
    fail "Found #{invalid_count} invalid records" unless invalid_count == 0
  end
end
```

## Re-runnable by default

If a data migration raises an error, what should you do?  Data migrations **should be designed to be re-runnable** and if any errors occur, Rails will automatically rerun your migration the next time you run `rake db:migrate`.

It's also a good idea to [define inner classes within your migration that shadow your application models and use `reset_column_information` to ensure your migration has access to the latest version of the model's schema](http://guides.rubyonrails.org/migrations.html#using-models-in-your-migrations).

Let's take one last look at this example and make sure that the migration is re-runnable and doesn't update records that have already been fixed.

```ruby
def UpdateInvalidUsers < ActiveRecord::Migration
  def up
    say "Found #{User.where(status: 'invalid').count} invalid records"

    say_with_time "Updating invalid users..." do
      count = 0
      User.where(status: 'invalid').find_each do |user|
        say "Updating user: #{user.id}"
        user.update!(status: 'valid')
        count += 1
      end
      count
    end

    invalid_count = User.where(status: 'invalid').count
    fail "Found #{invalid_count} invalid records" unless invalid_count == 0
  end
end
```

With these fundamental techniques under your belt, you can take your data migrations to the next level and even explore additional tools like [the migration_data gem](http://railsguides.net/change-data-in-migrations-like-a-boss/) that make Rails migrations **even** easier.
