---

title: "Monitoring workling/starling queue with GOD"
date: 2009-04-15
comments: false
tags:
 - ruby
---

_Everyone_ knows that there's no decent ruby solution for monitoring server side processes.

[GOD](http://god.rubyforge.org) is the best option we have ([for now](http://twitter.com/wireframe6464/status/1511506770)), and we have to make do with the tools at hand. It is an absolutely cryptic and arcane library to work with, but luckily it is easily extensible to add new functionality.



I've been using starling/workling in my current project and needed to monitor the health of my starling queue. There can be sudden bursts of load on my starling queue, and the workling processes may fall behind and not process items in the queue fast enough. There is a starling\_status script that can be used to manually check on the health of the queue, but I got a little tired of sitting at my keyboard day after day periodically running the script.



So, I wrote up a monitoring task that will notify me when the queue is backed up, and when/if it recovers back to a good state. Just drop this into your existing GOD configuration script, and tweak for the queue you need to monitor.


```


God.task do |w|

 w.name = "starling-queue"

 w.interval = 1.minute

 w.valid_states = [:healthy, :backed_up]

 w.initial_state = :healthy


 require 'yaml'

 config = YAML.load_file("#{RAILS_ROOT}/config/workling.yml")[RAILS_ENV]

 w.transition(:healthy, :backed_up) do |on|

 on.condition(:queue_size) do |c|

 c.port = config['listens_on']

 c.queue = 'queue_my_workers__my_queue_items'

 c.greater_than_size = 100

 end

 end

 w.transition(:backed_up, :healthy) do |on|

 on.condition(:queue_size) do |c|

 c.port = config['listens_on']

 c.queue = 'queue_my_workers__my_queue_items'

 c.less_than_size = 100

 end

 end

end

```



Here is the GOD extension to connect and monitor the health of the starling queue. To install it, simply copy this code into your GOD configuration script as well.


```


module God

 module Conditions

 class QueueSize  require 'starling'

 attr_accessor :port, :queue, :less_than_size, :greater_than_size


 def initialize

 super

 self.port = nil

 self.queue = nil

 self.less_than_size = nil

 self.greater_than_size = nil

 end


 def valid?

 valid = true

 valid &= complain("Attribute 'port' must be specified", self) if self.port.nil?

 valid &= complain("Attribute 'queue' must be specified", self) if self.queue.nil?

 valid &= complain("Attribute 'less_than_size' or 'greater_than_size' must be specified", self) if self.greater_than_size.nil? && self.less_than_size.nil?

 valid

 end


 def test

 server = Starling.new(self.port)

 remaining = server.stats[self.port][self.queue]

 if self.less_than_size

 remaining.to_i  else

 remaining.to_i > self.greater_than_size

 end

 end

 end

 end

end

```



I only wish there was another option other than GOD to do this. Writing the extension was fairly straight forward, but the DSL for configuring transitions is absolutely awful. Maybe someone can write a **usable** DSL that re-uses the GOD extensions and exposes a more "humane" interface.

