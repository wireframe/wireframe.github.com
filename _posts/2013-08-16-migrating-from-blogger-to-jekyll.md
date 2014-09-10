---

title: "Adios Blogger. Hello Jekyll!"
---

> It's been a long time coming...

For a variety of reasons, both personal and professional, my blogging pasttime
has pretty much come to a screeching halt.

With my [recent job change]({% post_url 2013-07-16-a-new-day %}),
I've renewed my commitment to blog and now is a perfect opportunity to
revisit my workflow and toolset.

### Blogger is teh suck

[Blogger](http://blogger.com) has been my blog engine of choice for the past
few years, but the thought of jumping back into blogging with the venerable
Blogger system doesn't excite me for a number of reasons...

First, I **hate** WSIWYG editors. I absolutely loathe and abhor them.
As a writer, I need to focus on the *content*, and not be constantly fiddling
with the *markup* generated.  As a Ruby developer writing blog
posts, code snippits are absolutely *hell* when you have to
fight with a WSIWYG editor.

In the end, I have found it infinitely easier to just write my posts in
[Markdown](http://daringfireball.net/projects/markdown/) and then export the
generated HTML and dump them into Blogger's HTML editor untouched.  So, why not
skip all of the run around and work with a blog engine that is Markdown compatible?

### Enter Jekyll

[Jekyll](http://jekyllrb.com/) is a static website framework perfect for blog authors
built by the awesome folks at [Github](http://github.com) and has caught on like
wildfire with the development blogging community.

Jekyll is *very* developer friendly and includes all the tools you need to build a
static site that *feels* like a mini-app (paritials, variables, etc).
Liquid templates are going to take some time to get used to, but the basics are easy
to grasp and there's really no need to dig in much deeper.

Things I like:

* Simple yet flexible
* Full control - I own the HTML, CSS, and JS libraries and am not limited by a theme chooser.
* Git integration - offline editing, commit, push, and your content is live!
* No ads, banners, etc polluting my site!

### The Mass Exodus

This isn't the first blog migration I've done.  I've had a blog now for over
ten years going all the way back to when good old [JRoller](http://jroller.com)
was the new hotness.  I carried those posts along to Blogger, and they'll
stay with me as I transition to the next blog engine...

There are *plenty* of [resources](http://jekyllrb.com/docs/migrations/) available
for [exporting Blogger](http://blog.coolaj86.com/articles/migrate-from-blogger-to-jekyll.html)
posts [to Jekyll](https://gist.github.com/kennym/1115810),
and it didn't take much work to whip up a [custom ruby script](https://github.com/wireframe/wireframe.github.com/blob/master/_blogger_archive/import.rb) that did a great job
migrating the HTML posts from Blogger into Jekyll format.  I even took the extra
step to convert the HTML posts into Markdown and I'm happy to say that it did a
pretty great job and only required some minor manual tweaks to clean up afterwards.

Making the transition seamless was a breeze and only required me to
[tweak the Jekyll permalink URL to match the old Blogger URL structure](https://github.com/wireframe/wireframe.github.com/blob/master/_config.yml#L3), and then update the DNS entry to redirect my
old blog.codecrate.com domain over to the Github hosted codecrate.com site.

### To Infinity and Beyond!

Now that the pain is over, it's time to get back in high gear pushing out some new posts!