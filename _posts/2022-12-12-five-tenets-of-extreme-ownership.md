---

title: "Five Tenets of Extreme Ownership"
featured_description: >
  Why an engineer's job is the customer outcome, even when it takes zero lines of code
tags:
- engineering
- culture
- leadership
---

*Originally posted on the BetterUp engineering blog: [Five tenets of extreme ownership on BetterUp's engineering team](https://build.betterup.com/extreme-ownership-at-betterup/)*

All team members at BetterUp are expected to exemplify “Extreme Ownership.”

But what does that really mean? And more specifically, what does that mean for an engineer?

As the CTO at BetterUp, I’ve spent a lot of time pondering these questions. And — surprise — the answer isn’t just “shipping code when we say we’re going to.”

At the end of the day, extreme ownership is about something bigger: **unlocking our customers’ potential**.

This new mindset can be hard to adopt at first, but it boils down to how you behave day-to-day. Below, I share the five tenets we abide by and how we overcome challenges to deliver an excellent customer experience.

## Tenet 1: We own the outcomes.

A phrase from [Alexi Robichaux](https://www.linkedin.com/in/alexirobichaux/), CEO of BetterUp, has always stuck with me: “if we can impact our members’ lives by selling cotton candy, let’s do it.”

In engineering terms, we’ve interpreted this as, “if you can impact our members’ lives without writing a single line of code, do it.”

Everything you do should contribute to the customer experience in some way. That’s your job.

Every line of code that doesn’t add exponential value to our customers is essentially tech debt. Similarly, each customer issue you encounter is your responsibility — even if it’s not in your wheelhouse. Specialties and expertise are superpowers but should not limit your ability to impact customers.

## Tenet 2: We build it. We own it.

Although the customer experience is everyone’s responsibility, we collectively own our team’s work.

Let’s say I build a new feature. After it hits production, I spend the next eighteen months fielding Slack pings from all areas of the business. No one knows what it is, what it does, or how to fix it if something goes wrong.

This is an example of a systemic failure of ownership — a single point of failure waiting to happen. To prevent these situations, engineers should co-develop solutions, provide code review feedback, and run end-to-end testing.

Ownership at the team level applies even when priorities change. If we own a system that will no longer be used, we still own it until it’s fully offline. Every team member should be able to debug and support that system’s operational needs.

## Tenet 3: We use it. We steward it.

If we use it, we should steward it.

Improving something you depend on — whether it’s part of our tech stack, our SOPs, or even open source software libraries we use — improves your effectiveness and has a multiplier effect for other teams relying on that infrastructure.

![Ownership models. Shallow ownership circles only the application layer: ownership of systems that fall directly within the domain. Deep ownership circles a vertical slice through application, platform, and infrastructure: ownership of all system dependencies that impact the domain.](/images/2022-12-12-ownership-models.png)

So think of your work as a community garden. By pruning the weeds, you help the next gardener’s harvest. As we contribute to systems outside of our core domain, we need to pay it forward. As the boy scouts like to say, “always leave the campground cleaner than you found it.”

However, it’s hard to incentivize good stewardship when people start relying on others to do everything. And that is why we leverage ownership rotations and assign defacto ownership to specific systems. Rotations create an equitable distribution of work for activities, and assigned owners help minimize surface area.

## Tenet 4: We don’t act as gatekeepers.

Ownership doesn’t mean that we have exclusive rights. In fact, it’s the opposite.

Our mission is so big that we can't achieve it alone. So we need to empower others and help them become effective contributors, too.

This involves creating documentation, making C4 models, and walking people through your thought process. It also includes clarifying the long-term direction for new, old, and adjacent team members.

It does not mean acting as an approver or blocking a release.

## Tenet 5: We do what we say.

Ultimately, we are here to carry out our mission and must do whatever it takes to accomplish that goal.

So, our word is our bond to operate with integrity. We do what we say, deliver on our commitments, and own our time.

Day-to-day, we practice effective estimation, prioritizing the activities that will significantly impact our customers and provide the quickest path to learning — whether that’s deep work time or intentional collaboration.

We use retrospectives and blameless postmortems as opportunities for growth. We leave meetings with clear action items, not just hopes for the future. And when the unexpected arises, we revise our plans and re-negotiate with our stakeholders.

## Developing engineering talent

By following these five tenets, BetterUp’s engineers make a habit of putting themselves in the customers' shoes. They also act as a team, staying accountable to themselves and each other. Overall, we’ve found that these best practices enhance our customers’ experience and grow our engineers into more reliable, innovative, and creative team members.
