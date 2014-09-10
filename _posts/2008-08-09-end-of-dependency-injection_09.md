---

title: "The End Of Dependency Injection"
date: 2008-08-09
comments: false
tags:
 - ruby
 - java
 - testing
---

Dependency Injection is a common technique in Java applications.  I have a long history of Java development in a Test Driven Development environment so Dependency Injection has been a way of life for a long time.  It's a tried and true practice and is an absolute requirement when developing Java software, but it's simply not needed when working with a dynamic language like Ruby.  Why?


If you want to write testable Java code, you NEED Dependency Injection.  Let's start with an example.


```java
//Without Dependency Injection
public class MyService {
  public void doWork() {
    DatabaseConnection connection = new DatabaseConnection();
    connection.commit();
  }
}
```

What makes this previous block of Java code untestable?  It's because of the "new" keyword.  In Java, "new" is a magic keyword and there's nothing you can do to circumvent the code that executes when it fires. In order to test the my code with various DatabaseConnection behavior, you need to inject the DatabaseConnection so unit tests can configure the expected behavior.


```java
//With Dependency Injection
public class MyService {
  private final DatabaseConnection connection;

  public MyService(DatabaseConnection connection) {
    this.connection = connection;
  }

  public void doWork() {
    connection.commit();
  }
}
```


It's unfortunate that making my code "testable" doubles the amount of code.  It also reduces context of the code and makes its purpose less clear.  Is this really necessary?  In Ruby, "new" is just another method that you can easily override to facilitate testing and you don't need to make any changes to your class to inject test dependencies.


```ruby
#Ruby Code
class MyService
  def do_work
    connection = DatabaseConnection.new
    connection.commit
  end
end
```


This Ruby code is just as testable as the previous Java example and there's no Dependency Injection required.  Instead of having to "jump through hoops" and inject the DatabaseConnection object into my class, I can just override the DatabaseConnection.new method to return a testable mock implementation.


```ruby
require 'mocha'
class MyServiceTest
  def test_can_mock_connection
    fake_connection = mock
    fake_connection.expects(:commit)

    DatabaseConnection.expects(:new).returns(fake_connection)
    service = MyService.new
    service.do_work
  end
end
```


This sample test uses the excellent [mocha mock library](http://mocha.rubyforge.org/), which is very similar to JMock, to inject the test implementation.  You can accomplish the same thing with standard ruby code, but the mocha library provides a very nice API for injecting test dependencies.  The real difference here is that Ruby is an open language that allows for overriding implementation details.  The beauty of Ruby is that this same approach can be applied to other areas that are normally very tricky for testing Java code (ex: static methods).


Some may raise the argument that Dependency Injection is intended for externalizing configuration to allow for multiple implementations, and not intended for increasing testability.  That is a joke.  When was the last time you used more than one implementation for your injected object?  In reality, there are only two implementations.  The real implementation, and the mock implementation used for testing.  Dependency Injection is used for testability, not configuration. Period.

