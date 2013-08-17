---
layout: post
title: "Security Administration Frustration"
date: 2004-01-02
comments: false
categories:
 - security
---


   
Let me just say that I'm frustrated at the plethora of different
   
security infrastructures that exist in my environment and their apparent
   
lack of interoperability. For starters, I'll list the number
   
of different accounts I have to deal with on a daily basis:
   
   
  -
   
1 Windows NT account
   
  -
   
2 seperate Linux accounts
   
  -
   
1 intranet account to access internal applications
   
  -
   
1 Issue Tracking account ([scarab](http://scarb.tigris.org))
   
  -
   
1 Reporting system account ([openreports](http://oreports.sf.net))
   
  -
   
7 seperate database accounts
   
   
   
I can't imagine the total cost of supporting this infrastructure, but it
   
has to be immense. Not to mention that managing this many accounts leads
   
to a complete lack of security. There's no possible way for me to keep
   
up with changing all of these passwords every 3 months like I should.
   
   
   
The most frustating aspect to this setup to me is the inability to get
   
our internal applications to work with Scarab and Openreports. I've
   
developed a suite of internal applications that use JAAS to provide
   
independance accross any account management system (LDAP, DB, etc), and
   
it has worked EXTREMELY well. Scarab and Openreports install their own
   
set of users/roles and all security checks are done outside of a JAAS
   
configuration.
   
   
   
The question remains why would a server side Java application not use
   
container managed security? SAML and the [
   
Liberty Alliance](http://www.projectliberty.org) are still on the horizon and promise to allow these
   
desparate systems to work together somehow, but until that time, why do
   
we keep reinventing the wheel? There is an obvious need for Java open
   
source account management software. Does anything exist?
   
