---
layout: post
title: "iPhoto Backup Gem"
date: 2013-11-29
tags:
 - ruby
 - mac
 - opensource
---

I've had a very simple photo archival strategy in place for over 10 years now which basically boils down to grouping related images in a folder named for the event with an [ISO8601 date prefix](http://en.wikipedia.org/wiki/ISO_8601) for easy organization.

```
Pictures
|____2013
| |____2013-08-30 End of Summer BBQ
| | |____IMG_3842.jpg
| | |____IMG_3843.jpg
```

It's a super low-tech solution that has worked like a dream across multiple operating systems, computers, and cameras.  As long as operating systems have concepts of files and hierarchical folders, this strategy should work great for a *long* time to come.

Over the past 5 years, I've been a Mac user and have come to really like iPhoto.  It gets the job done for organizing photos with a clean and fairly intuitive interface.  My only real complaint with iPhoto is how difficult it is to get access to my original files for archiving and backups.  *Don't even get me started on Time Machine and vendor lock-in...*

I adapted [a home-rolled python script](https://github.com/wireframe/dotfiles/blob/628b982d9fc4e7b4cc9e6ca806cae81b541f9bbd/home/bin/iphoto_export.py) as a first solution for extracting photos out of iPhoto and into my standard directory structure and it worked relatively well, but I finally got around to porting it to Ruby which is a **huge** win for code clarity since I am **not** a fan of Python.

The [iphoto_backup gem](https://github.com/wireframe/iphoto_backup) is now available on ruby gems for *anyone* interested in extracting and archiving photos out of iPhoto.  It is a simple command line application that will copy the files out of the original iPhoto location into the backup directory of your choosing.

```bash
$ iphoto_backup

Processing Roll: Wedding Pics...
  copying /iphoto/file.png to /my/custom/backup.png
```

Additional instructions and information are available on [Github](https://github.com/wireframe/iphoto_backup), and as always, **pull requests are welcome!**
