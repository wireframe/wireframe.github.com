---

title: "Homesick for Managing Dotfiles"
---

> I'm homesick to-night, just homesick,
> O! how I long once more.
> Just to sit as of old in the twilight.
> On the step of the old kitchen door.
- [Homesick by Ella Goodwin](http://skyways.lib.ks.us/poetry/homesick.html)

Configuring a new development laptop can be a downright pain.  From your bash configuration to git aliases, it's easy to loose a day or five getting everything setup *just right*, and more often than not there will always be a few settings that get lost along the way...

Fear not good friends, [Homesick](https://github.com/technicalpickles/homesick) is a tool that makes bootstrapping your next environment as simple as:

```
$ gem install homesick
$ homesick clone wireframe/dotfiles
$ homesick symlink wireframe/dotfiles
```

### BOOM!

[My dotfiles](https://github.com/wireframe/dotfiles) have now carried me through three OS installations in the past two monthes and each installation has been absolutely seemless.  Having dotfiles in version control has made keeping changes in sync across machines a dream as well as sharing configuration with other developers.

The sky is the limit for what you include in your dotfiles, and the key features of **my** dotfiles include:

* environment initialization (ex: path, aliases)
* bash configuration (ex: prompt, autocompletion, etc)
* helpful scripts and commands (ex: git-cleanup.sh)
* OSX system default preferences
* VIM configuration
* Sublime Text configuration
* Git configuration (aliases, merge settings, etc)
* Ruby configuration (IRB, Rubygems, Rspec, etc)

### Onward to automation

Homesick is a simple and powerful tool that takes 90% of my pain away when setting up a new environment, but there's there's still work to be done to make setting up a new environment literally a turn-key solution.  [Boxen](http://boxen.github.com/), [KitchenPlan](http://vanderveer.be/blog/2013/04/14/presenting-kitchenplan/) and other tools are now emerging in this space that look **very** interesting, but each of them adds a new layer of complexity that makes them more of an investment than the simplicity of Homesick.
