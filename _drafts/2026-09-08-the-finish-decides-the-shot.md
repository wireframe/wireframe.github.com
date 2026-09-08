---
title: "The Finish Decides the Shot"
featured_description: >
  Why the work after the experiment decides what the experiment was worth
tags:
- engineering
- product-development
- leadership
- innovation
---

I woke up at 4am on the second morning of a technical strategy offsite with a splinter in my brain. We had spent months pushing on velocity and the measures had moved. Cycle time was under monthly review at the executive level. Nothing about the organization felt fast.

So I started writing down what I was seeing. We were not articulating why an investment was worth making. We had no clear answer to "how will we know if we're right, or wrong?", because we assumed we were right and then went looking for evidence to confirm it. And we were not sprinting to the point of learning.

All of it had the same cause. People hesitated to innovate and take on short-term complexity, because nobody was confident the follow-through would happen.

Our own improvement plan had it in writing. One of the drivers we had listed for improving cycle time was to separate post-release verification from execution, so each could be measured on its own. Split them and verification becomes something you do after the work. Optional. And we all know what happens to optional work. It never gets done.

## The Swing Doesn't End at the Ball

A golf swing doesn't end at the ball. Contact lasts about half a [millisecond](https://sharkclub.golf/golf_physics.html), and the ball is long gone before the follow-through exists, which makes the finish look like the optional part.

Every experiment we run adds complexity until we know the answer. Two implementations of the same thing. A flag still sitting in the code. For as long as the question is open, the system is more complicated than the business needs it to be.

And we should expect to be wrong most of the time. Marty Cagan's first inconvenient truth about product is that ["at least half of our ideas are just not going to work."](https://www.svpg.com/the-inconvenient-truth-about-product/) The measured numbers run worse. Only one third of the ideas tested on Microsoft's experimentation platform improved the metric they were designed to improve, and one practitioner in the same passage put [his own hit rate at a major league batting average](https://www.exp-platform.com/Documents/2015%20Online%20Controlled%20Experiments_EncyclopediaOfMLDM.pdf).

The complexity an experiment leaves behind is supposed to be debt. Debt arrives two ways, intentional and accidental, and the accidental kind is still real debt accruing real interest. An experiment gives you the intentional kind: priced, on the books, with a repayment date attached, if anybody bothers to write one down.

Starting the swing is the easy part. The finish is where the work is, and agents did not change that. Both halves got faster, and an agent will write the removal as happily as it wrote the experiment. Both still need a human to start one and to finish one, and that is the part that got scarce. DORA's 2025 report names the tradeoff: "higher AI adoption is associated with an increase in both software delivery throughput and software delivery [instability](https://dora.dev/insights/balancing-ai-tensions/)." The finishing is measurably behind. Across 302,600 verified AI-authored commits, [22.7% of the issues introduced were still sitting at HEAD](https://arxiv.org/html/2603.28592v2). Last month I wrote that [every parallel workstream you add is more context to hold, and you pay for it again every time you switch]({% post_url 2026-08-21-from-pilot-to-air-traffic-controller %}). Attention is the constraint now. Typing never was.

## One Swing, Two Outcomes

If we're right, we pay for a migration onto the new path. If we're wrong, we pay to remove what we built. Neither bill was on the original estimate.

The two bills behave nothing alike. The success case is a small, known workstream, and it gets done, because somebody in the business wants the new thing and will keep asking until the old path is gone. The failure case has nobody asking. It is also the case where the entire value of the experiment is sitting in the finish.

Which means one plan can't cover both. The work waiting on a yes is not the work waiting on a no, and the team finds out which one it's doing the moment customers answer. Re-cutting the plan, the timeline and the scope right then, on information that arrived that morning, is a real skill and a rare one. A team that can only run the plan it wrote before it knew anything will default to the yes path, because that is the path the plan describes.

A failed experiment delivers value only if somebody closes it out. Do it well and you leave behind the abstraction that makes the next experiment faster, plus what you learned about the market, the technology and the approach, distributed back into the organization instead of filed in a post-mortem nobody opens. I've called that [composting]({% post_url 2026-02-05-the-greenhouse-innovation-incubator %}). Leave it better than you found it.

Skip it and the bill still arrives, with interest. Every experiment left open is a standing tax on the next one: another path through the code, another thing to hold in your head, another question a new engineer has to ask before they can change anything. The experiment nobody closed out makes the next one slower, and the one after that slower still.

## Unfinished Work Teaches Hesitation

Teams get slow to take on short-term debt when nobody believes the job will get finished. Everyone has watched a follow-through go into the backlog and die there, so "we'll clean that up after" stops sounding true. Nobody refuses the work. What shows up instead is trepidation: the proposal that sits a week longer than it needed to, the spike that gets discussed in three meetings and started in none, the scope quietly trimmed so there's less to unwind later.

That hesitation is learned, and here is what teaches it. Whether the finish happens depends on how much impact the result had, not on how much work it left behind. A big result gets a sponsor. A small one gets nobody. Madsen and Desai studied the global orbital launch vehicle industry and found that organizations learn more from failure than from success, that knowledge from failure depreciates more slowly, and that the size of the failure decides how much gets learned at all:

> We found that the knowledge gained from success was often fleeting while knowledge from failure stuck around for years.
> — Vinit Desai, on *[Failing to Learn?](https://www.sciencedaily.com/releases/2010/08/100823162322.htm)*, Academy of Management Journal, 2010

Small failures get cleared and forgotten. Six foam-shedding events on the shuttle's external tank preceded Columbia. The last one before the accident dented the strut ring by about four inches, was raised at the next mission's flight readiness review, and was cleared as not a safety-of-flight issue. The seventh produced [29 recommendations](https://www.nasa.gov/history/columbia-accident-investigation-board-synopsis/). Systems don't slide gradually from working to broken. They read functional right up until the one move that takes them to failed.

Now hold that next to the standard advice about experimenting well. Amy Edmondson's four markers of intelligent failure are that it's in new territory, it's in pursuit of a goal, you've done your homework, and the failures that occur are small and not dangerous. That last one describes the lowest-impact outcome available. **So the experiments most worth running are exactly the ones nothing will ever demand a finish for.** Her markers are also all about designing the experiment. Not one of them concerns what you do once the result comes back.

A small result produces no completion moment either. I've made that argument from the other end: [a team that never gets to the end of anything has nothing to celebrate, and the behavior goes extinct]({% post_url 2026-08-07-recognition-is-infrastructure %}). The reward attaches to the learning collected, never to the failure itself. Tanya Reilly named the status version of the same problem in [Being Glue](https://www.noidea.dog/glue). Finishing a failed experiment produces no feature, no demo, and no line on a promotion packet.

One more cost, and it's the one I missed for years. A hedged swing returns a false answer. When the team has no confidence the follow-through will happen, they place a smaller, more timid version of the experiment, and it fails for reasons that have nothing to do with the hypothesis. Statisticians call an underpowered test a Type II error, and it is the most expensive routine mistake in experimentation because it hides: it looks like a negative result rather than bad methodology. The organization files it as a failed idea, and the hypothesis it was built to test never got an answer.

## Why the Finish Goes Missing

I keep expecting the causes to be interesting and they never are. Planning so far ahead that the finish falls outside the horizon. Ducking the difficult conversation. Not escalating. Not renegotiating a timeline that stopped being true weeks ago. All four have the same root, and I've already named it: nobody in the business is asking for the finish. So it never wins a prioritization argument on its own merits, and the backlog is where it goes to rot.

The psychology is just as predictable, which is why the answer has to be design rather than encouragement. David Marquet:

> This aversion to stopping the clock spills over to an aversion to complete. We are programmed to continue — continue the work, continue on to the next task.
> — L. David Marquet, *[Leadership Is Language](https://www.penguinrandomhouse.com/books/566179/leadership-is-language-by-l-david-marquet/)*

Anything that already exists defends itself. An in-flight project defends itself against its own replacement, because a legitimate option at an interim decision point has to overcome the inertia of the old plan before it gets considered at all. A shipped feature does the same against its own removal, which is why sunsetting is always hard and why removing something already released is harder than building it was.

None of this is news to anyone who manages people. When *Impact Players* asked 170 managers what frustrated them most, three of the top ten answers involved failure to finish, and the number three answer was having to chase employees to do the things they had already committed to do. That is a manager describing their job as professional nag.

One reason comes with its own fix. Barry Staw's 1976 "Knee Deep in the Big Muddy" found that people held personally responsible for a failing decision escalate their commitment to it more than people who inherited the same mess. The person who ran the experiment is the worst available judge of when to kill it, and the more of their identity is riding on the result, the worse that judgment gets. So don't put the stop decision in their hands.

## One Motion

There is an objection underneath all of this. Roger Martin argues that the line between strategy and execution is a fiction, and that drawing it does real damage:

> if we can't draw a line in the organization above which strategy happens and below which execution does, **what is the use of the distinction between strategy and execution, between formulation and implementation? The answer is none at all.** It is a pointless distinction that in no way helps the organization.
> — Roger Martin, *[The Execution Trap](https://hbr.org/2010/07/the-execution-trap)*

Apply that here and the post falls over. If deciding and doing are one activity, there is no separate phase to plan for, and "follow-through" is just a name for work that should never have been split off.

He's right. And if a decision and its execution are one motion, then a decision made without its finish planned was never a whole decision.

Committing to the full motion is what keeps the club accelerating through impact, and planning to stop at the ball is what makes you decelerate before you reach it. Biomechanically, the follow-through is only deceleration after contact. The [swing you intended](https://www.mytpi.com/en/articles/biomechanics/kinematic-sequence-revisited) is what shaped the strike. The finish isn't bolted onto the swing; it's what makes the swing one thing.

Drucker got here in 1967, which I'd rather cite than reinvent:

> Unless a decision has "degenerated into work" it is not a decision; it is at best a good intention.
> — Peter Drucker, *[The Effective Decision](https://hbr.org/1967/01/the-effective-decision)*

What Drucker doesn't cover is the unwinding. His process builds the action into the decision and then tests whether the decision was right, and it never asks what happens to the thing you built when the answer comes back no. Two years ago I wrote up the development process I run teams on, and [its third commitment is closing the loop]({% post_url 2024-04-13-the-commit-cycle %}). I had the sequence right and the weighting wrong. Closing the loop is what makes the first two commitments mean anything.

Every team already writes down what "done" means, and the finish is not in the definition. The Scrum Guide defines Done as "a formal description of the state of the Increment when it meets the quality measures required for the product," and adds that "the moment a Product Backlog item meets the Definition of Done, an [Increment is born](https://scrumguides.org/scrum-guide.html)." Quality measures on the thing built. Nothing about business outcome, nothing about removal. My own organization made the same move from the other direction when it scored verification outside the work.

And look at what we named the missing part. **Cleanup.** A word for the thing you do after the real work, if there's time, and the first thing cut when there isn't. Nobody calls a mortgage payment tidying up. The debt is a loan, the finish is the repayment, and "cleanup" is the word we reach for once we've already decided not to make it.

So where does the line fall? Engineering is a profession of creating *and* reducing complexity, and the job is keeping a system only as complicated as the business it runs. [Domain-driven design](https://www.domainlanguage.com/ddd/reference/) has been arguing a version of this for twenty years: base the design on a model of the domain, and hold the language of the code and the language of the business to the same words. Which hands you a test. When the business pivots in a way that feels like a natural extension, the architecture change should feel like a natural extension too. If a small move in the business demands a large move in the system, the system has drifted off the domain, and every experiment nobody closed out is one of the reasons it drifted. **Done is when the system's complexity is back in line with what the business actually needs**, whichever way the answer came out.

## Accelerate Through Impact

A proposal that can be finished answers three questions: why we're doing this, how we'll know if we're right, and what happens next either way. Most teams get partial credit on the first two. The third gets waved through. How much rigor those answers need scales with reversibility: a two-way door earns a light process, and a one-way door earns all of its rigor up front, before anything runs.

The finish belongs in that same proposal, on that same timeline, decided while the team still wants to run the experiment. Not scheduled separately, and not "revisited later." Gollwitzer and Sheeran's meta-analysis of 94 studies found that if-then plans made in advance raise goal attainment at [d = 0.65](https://cancercontrol.cancer.gov/sites/default/files/2020-06/goal_intent_attain.pdf), and the effect holds as sample sizes grow. Annie Duke's version in *Quit* points the same mechanism at exits: deciding in advance is what makes the exit survive the moment you need it. Before a rebrand, we laid out the timeline with the post-release feature flag work written into it. It was in the plan, so it happened. Anything that goes in the backlog instead is destined to never get done.

When the finish turns out to cost more than you planned, renegotiate rather than absorb. Either close it out in a way that resolves the ask permanently so it never comes back to you, or go ask for what finishing it requires. Absorbing it quietly is how it ends up in the backlog.

The lever nobody reaches for is the experiment itself. Shorten the experiment, not the finish. The best argument I know for it is a ceramics class, where the teacher graded half the students on the quantity of pots produced and half on the quality of a single pot:

> Well, came grading time and a curious fact emerged: **the works of highest quality were all produced by the group being graded for quantity.** It seems that while the "quantity" group was busily churning out piles of work — and learning from their mistakes — the "quality" group had sat theorizing about perfection, and in the end had little more to show for their efforts than grandiose theories and a pile of dead clay.
> — David Bayles and Ted Orland, *Art & Fear*

Success lives in the number of swings you take. Finish each one, and eventually one of them goes in.

Sometimes you abort. The answer arrives early, or the ground shifts, and you pull up before contact. Stop there without a finish and you don't get nothing. You get a different outcome, and one nobody chose: the flag still in the code, two implementations still running, a system shaped by a question that never got resolved either way. This is where kill fees come from. Bailing out earns nothing on its own, so some organizations pay people to stop, and what they are funding is the finish on a swing that never reached the ball. Cool-down periods between projects are the same admission in friendlier clothes.

There is one honest exception, and the difference is that you choose it. Golfers shorten the finish deliberately: the punch shot, played with a truncated follow-through to keep the ball low under the wind. It works. It also travels shorter, and every golfer who hits one knows the result will be smaller before they swing. That is intentional debt, priced and on the books. Uncle Bob draws the line at the version nobody chose:

> A mess is not a technical debt. A mess is just a mess. Technical debt decisions are made based on real project constraints. They are risky, but they can be beneficial. The decision to make a mess is never rational, is always based on laziness and unprofessionalism, and has no chance of paying off in the future. **A mess is always a loss.**
> — Robert C. Martin, *[A Mess is not a Technical Debt](https://sites.google.com/site/unclebobconsultingllc/a-mess-is-not-a-technical-debt)*

Cut the follow-through when you mean to, and price what you're giving up. Finding out afterward that you played a punch shot is how you end up with a mess.

Go open your team's definition of done. Count how many of its lines describe the thing you built, and how many describe the state you're leaving the system in.
