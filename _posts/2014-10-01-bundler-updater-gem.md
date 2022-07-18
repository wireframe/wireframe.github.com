---
title: "Bundler Updater Gem"
tags:
 - opensource
 - ruby
---

<p class="text-center">
<img alt="If you bundle update your entire Gemfile, you're going to have a bad time." src="/images/bundle_update_bad_time.jpg" />
</p>

On any reasonably sized production project, you should **absolutely never** update all outdated gems at once.
There are new versions of gems being released daily and each time you update your bundle, you'll be pulling in changes (*and bugs*)
from your dependent gems along with all of their transitive dependencies.  For example, on my current application, running
`bundle update` pulled in **52 updated gems**.   Talk about a risky release!

To help mitigate the risks associated with blindly updating **all** of your gems, I wrote
[a small Ruby script to only update a subset of gems at once](https://gist.github.com/wireframe/3f7e431f0d63ddb381c0).
With this script, I can cherrypick a few related gems and release them in a smaller batch and feel **much** more confident about
what changed and what needs to be tested.

After using this script over the past year, I finally decided to wrap this utility into a reusable gem.  Now, introducing the
*cleverly named* [bundler-updater gem](https://github.com/wireframe/bundler-updater)!  The bundler-updater gem will examine your
Gemfile for all outdated dependencies and then interactively prompt you for which gems you would like to update.

```bash
$ bundler-updater
> Update my_gem from 0.0.1 to 0.0.2? (y/n) y
> Update another_gem from 1.0.0 to 2.0.0? (y/n) n
>
> Updating my_gem...
```

It's simple and a *huge* timesaver compared to manually running `bundle update each_individual_gem` over and over again.
Drop me a line if you find it useful or if you have any suggestions!

NOTE: It's usually quite safe to bulk update non-production/test dependencies and it would be a nice enhancement for the bundler-updater
gem to support updating all gems a specified bundler group.

<span class="text-muted">#patcheswelcome</span>
