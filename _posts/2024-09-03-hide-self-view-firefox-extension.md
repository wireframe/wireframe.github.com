---
title: "Hide Self-View Firefox Extension"
tags:
- opensource
- firefox
---

I've clocked somewhere around 15,000 hours on virtual meetings over my last 15 years working remotely.  That's a *whole lot* of time spent with my "camera on" and "self-view off".

During the COVID shift to hybrid work, the themes of "Zoom burnout" and exhaustion became much more prominent along with research on the impact to well-being.  One study specifically, by Dan Zahavi and Phillippe Rochat, identified that seeing a mirror of yourself on video calls is a significant driver of mental exhaustion (and your general well-being).
[The Uncanny mirror: A re-framing of mirror self-experience](https://www.researchgate.net/publication/47299891_The_Uncanny_mirror_A_re-framing_of_mirror_self-experience)

> It's taxing on us. It's stressful. And there's lots of research showing that there are negative emotional consequences to seeing yourself in a mirror. Professor Jeremy Bailenson, founding director of the [Stanford Virtual Human Interaction Lab](https://vhil.stanford.edu/)

The research maps very cleanly to my personal experience.  It's physically draining to see yourself all day long, and it's unnatural as well (when's the last time you were constantly staring at yourself in an in-person meeting?).  If you doubt the research, I recommend running your own experiment by checking your energy level after meetings with self-view on versus off.

If you're a Zoom user, you have the option to turn off your self-view automatically for every call, but if you're a Google Hangouts/Meet user, you've been out of luck...**until now**.  I'm happy to announce the release of [the "Self-View Hider" Firefox extension](https://addons.mozilla.org/en-US/firefox/addon/4fb48d0a83554adaac43/). This is a very simple Firefox extension that will automatically turn off the self-view for Google Hangouts/Meet for every call.

It's worth noting that this extension is a dirty, *dirty* hack.  Google Meet is a Single Page App (SPA) that makes it *incredibly* difficult to inspect relevant DOM elements and virtually interact with them.  There is some flakyness in the implementation due to inconsistent DOM layout and responsive layout changes, but it has reliably worked for me for the past several months.  Ideally, Google would make this extension obsolete by implementing this as a native user preference to turn off self-view.  In the meantime, if you have any suggestions, [shoot me a comment](mailto:comments@codecrate.com), or contribute to [the project here](https://github.com/wireframe/hide_self_view)!