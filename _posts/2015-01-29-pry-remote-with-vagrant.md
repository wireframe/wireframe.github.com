---
title: "Using pry-remote to debug within Vagrant VM"
tags:
- ruby
- protip
- vagrant
---

[Vagrant](https://www.vagrantup.com/) is awesome and an absolutely essential
part of every development environment.  Running your application within a
vagrant virtual machine **does** introduce a few challenges though...

One particularly nasty issue I hit recently was trying to debug some code using
my favorite Ruby debugging tool, [Pry](https://github.com/pry/pry).

The issue was that my application was launched within the VM using a linux process
manager (Ubuntu upstart) which means that the process is forked into the
background and it is not possible to halt the process to start a debugging
session using the standard `binding.pry` call.

## Pry-remote to the rescue!

Debugging background processes requires using the
[pry-remote](https://github.com/Mon-Ouie/pry-remote) gem which
was designed for this exact usecase.  All you need to do is
swap out the method calls from `binding.pry` to `binding.remote_pry` and when
your application server hits the debugger, connect to the background process using the
`pry-remote` command.  *Voila!*

## Connecting from the host OS

Now, debugging the background application process is awesome, but there is one
gotcha with this setup...**it only works from within the guest virtual
machine**.  That's pretty annoying for me since I like to use my host OS for terminal
commands and tools.

Vagrant supports port-forwarding from the host OS to the guest, but that
doesn't work in this case since the pry-remote gem is opening up a random port
each time the debugger is triggered.

To workaround this issue, I use this simple shell script that automates
connecting to the virtual machine and firing up pry-remote.

```bash
#!/bin/bash

# connect to application within virtual machine to debug running process
# binding.remote_pry should be used to trigger breakpoints
vagrant ssh -c 'cd /vagrant && bundle exec pry-remote'
```

This solution combines the awesomeness of debugging applications with pry with
the convenience of not needing to manually ssh into the virtual machine all the
time!
