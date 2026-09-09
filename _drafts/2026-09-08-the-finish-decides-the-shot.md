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

I woke up at 4am on the second morning of a technical strategy offsite with a splinter in my brain. We had spent months pushing on velocity. Cycle time was reviewed monthly at the executive level, and it was improving month over month. Ask anyone in a hallway, though, and nothing *felt* fast. Nobody was sprinting to learn from our customers.

Then I remembered a recent change to our processes. To measure execution on its own, we had split post-release verification into its own workstream. Two discrete units make execution look clearer. The side effect: work after the release became optional. And **optional work never gets done**.

That was the disconnect. The perceived slowness was hesitation to take on short-term complexity because nobody was confident the follow-through would happen.

## The Swing Doesn't End at the Ball

Contact between a golf club and ball lasts about half a [millisecond](https://sharkclub.golf/golf_physics.html). The ball is long gone before the follow-through exists, which makes the finish look like the optional part.

Product development runs the same way. Everything before contact is the work to get something into production. Contact is the launch. The follow-through is everything after: finding out whether it worked, then acting on the answer, or ["closing the loop" in Commit Cycle terms]({% post_url 2024-04-13-the-commit-cycle %}).

Golfers don't finish the swing for show. Committing to the full motion is what keeps the club accelerating through impact. Plan to stop at the ball and your swing slows, the trajectory at contact is altered, and the ball goes somewhere you didn't aim. **The finish decides the shot before the ball is ever struck.** A team that plans to stop at launch pulls up short the same way, and the experiment shrinks before it ever ships.

There is one honest way to shorten the finish, and the difference is that you choose it. The punch shot is played with a truncated follow-through to keep the ball low under the wind. It works. It also travels shorter, and every golfer who hits one knows the result will be smaller before they swing. That is *intentional* debt: priced, on the books, chosen before the swing.

Look at what we call the follow-through in software development. **Cleanup.** A word for the thing you do *after* the real work, if there's time, and the first thing cut when there isn't. "Cleanup goes in the backlog" is a sentence every engineer has heard, and the backlog is where it goes to rot. Nobody calls a mortgage payment tidying up. Uncle Bob draws the line:

> A mess is not a technical debt. A mess is just a mess. Technical debt decisions are made based on real project constraints. They are risky, but they can be beneficial. The decision to make a mess is never rational, is always based on laziness and unprofessionalism, and has no chance of paying off in the future. **A mess is always a loss.**
> — Robert C. Martin, *[A Mess is not a Technical Debt](https://sites.google.com/site/unclebobconsultingllc/a-mess-is-not-a-technical-debt)*

Cut the follow-through when you mean to, and price what you're giving up. Finding out afterward that you played a punch shot is how you end up with a mess.

## One Swing, Two Outcomes

Every swing's purpose is to make the shot, and **most of our shots are misses.** Anywhere from [half](https://www.svpg.com/the-inconvenient-truth-about-product/) to [two thirds](https://www.exp-platform.com/Documents/2015%20Online%20Controlled%20Experiments_EncyclopediaOfMLDM.pdf) of our experiments are *expected* to fail. Either way, the follow-through is ours to plan.

The follow-through for a miss and for a success are different jobs. If we're right, we pay for a migration onto the new path. If we're wrong, we pay to remove what we built, and write down what we learned. Neither outcome can be known in advance, and neither was in the original estimate.

The success case gets done because it's delivering value, so the follow-up work has permission to continue. The failure case is the common path, and it is also the case where **the entire value of the experiment is sitting in the finish.** A failed experiment delivers value only if somebody closes it out. Do it well and you leave behind the abstraction that makes the next experiment faster, plus what you learned about the market, the technology and the approach, distributed back into the organization instead of filed in a post-mortem nobody opens. I've called that [composting]({% post_url 2026-02-05-the-greenhouse-innovation-incubator %}).

Skip it and the complexity stays. Every experiment adds complexity. Multiple branches of logic, two implementations of the same thing, a flag still sitting in the code. Until the follow-through completes, the system is more complicated than the business needs it to be.

## Why the Finish Goes Missing

I keep expecting the causes to be interesting and they never are. Planning so far ahead that the finish falls outside the horizon. Not renegotiating a timeline that stopped being true weeks ago. Both have the same root: finishing is viewed as a nice-to-have, so it never wins a prioritization argument on its own merits.

Most experiments are small, and small results get cleared and forgotten. When we audited our own flags at the end of a platform year, several were over a year old, and "flags older than 90 days" became a line on the health scorecard. The standard advice about experimenting well makes this worse: keep failures small and cheap. **So the experiments most worth running are exactly the ones nothing will ever demand a finish for.**

A small result produces no completion moment either. I've made that argument from the other end: [a team that never gets to the end of anything has nothing to celebrate, and the behavior goes extinct]({% post_url 2026-08-07-recognition-is-infrastructure %}). Tanya Reilly calls the work that holds a team together and earns nobody a promotion [glue](https://www.noidea.dog/glue). Finishing a small failed experiment is glue: no feature, no demo, no line on the packet. Which is why it's the swing to practice. **What a team does well on small projects is what it does great on big ones.** The finish you build as a habit on experiments nobody is watching is the finish you'll have when the big one lands.

The psychology is just as predictable, which is why the answer has to be design rather than encouragement. David Marquet:

> This aversion to stopping the clock spills over to an aversion to complete. We are programmed to continue — continue the work, continue on to the next task.
> — L. David Marquet, *[Leadership Is Language](https://www.penguinrandomhouse.com/books/566179/leadership-is-language-by-l-david-marquet/)*

Anything that already exists defends itself. An in-flight project defends itself against its own replacement, and a shipped feature defends itself against its own removal, which is why removing something released is harder than building it was.

## Unfinished Work Teaches Hesitation

Everyone has watched a follow-through go into the backlog and stay there, so "we'll clean that up after" stops sounding true. Nobody refuses the work. What shows up instead is trepidation: the proposal that sits a week longer than it needs to, the spike that gets discussed in three meetings and started in none, the scope quietly trimmed so there's less to unwind later.

The experiments that do run are slower, too. Every open experiment slows the next one: another thing to hold in your head, another question a new engineer has to ask before they can change anything. The experiment nobody closed out makes the next one slower, and the one after that slower still.

One more cost, and it's the one I missed for years. **A hedged swing returns a false answer.** When the team has no confidence the follow-through will happen, they place a smaller, more timid version of the experiment, and it fails for reasons that have nothing to do with the hypothesis. An underpowered test mostly produces false negatives, what statisticians call Type II errors, and they hide: a false negative looks like a negative result rather than bad methodology. The organization files it as a failed idea, and the hypothesis it was built to test never got an answer.

## Accelerate Through Impact

**Every experiment answers three questions before it runs:**
1. why we're doing this,
2. how we'll know if we're right, and
3. what happens at the end, either way.

Most teams get partial credit on the first two and avoid the third altogether. Call it the either-way question. A plan that stops at launch is half a decision. Drucker got here in 1967:

> Unless a decision has "degenerated into work" it is not a decision; it is at best a good intention.
> — Peter Drucker, *[The Effective Decision](https://hbr.org/1967/01/the-effective-decision)*

**The finish belongs in that initial proposal, on that same timeline**, decided while the team still wants to run the experiment. Not scheduled separately, and not "revisited later." A meta-analysis of if-then plans found that deciding in advance [raises the odds you follow through](https://cancercontrol.cancer.gov/sites/default/files/2020-06/goal_intent_attain.pdf) by a medium-to-large effect. Annie Duke's version in *Quit* is kill criteria: decide what result means stop before you start, because in the moment you'll talk yourself out of it. One of our large rebrands put removal of the old branding, hidden behind a feature flag from day one, on the timeline. It was in the plan, so it happened. The split I woke up to at that offsite was the same rule broken on purpose. We pulled verification out of the plan to make cycle time easier to measure, the number improved, and [Goodhart's law](https://en.wikipedia.org/wiki/Goodhart%27s_law) collected: the measure became the target, and the finish was what we cut to hit it.

**Name the owner of the finish before the experiment starts, and don't make it the person running it.** [When ownership is unclear, the finish gets the bystander effect: everyone assumes someone else will do it, and it languishes in the backlog]({% post_url 2026-04-10-team-topology-ownership %}). The obvious owner is also the wrong one. Barry Staw's "Knee Deep in the Big Muddy" found that people held personally responsible for a failing decision escalate their commitment to it more than people who inherited the same mess. The person who ran the experiment is the worst available judge of when to kill it.

When the finish turns out to cost more than you planned, **renegotiate rather than absorb.** Either finish it in a way that settles the question for good, or go ask for what finishing it requires. Absorbing it quietly is how it ends up in the backlog.

Every team already writes down what "done" means, and the finish is not in the definition. The Scrum Guide defines Done as "a formal description of the state of the Increment when it meets the [quality measures required for the product](https://scrumguides.org/scrum-guide.html)." Quality measures on the thing built. Nothing about the business outcome, nothing about removal. Engineering is the profession of creating *and* reducing complexity, so **done is when the system's complexity is back in line with what the business actually needs**, whichever way the answer came out. Go open your team's definition of done and count how many of its lines describe the thing you built, and how many describe the state you're leaving the system in.

Then take more swings. The lever nobody reaches for is the experiment itself: **shorten the experiment, not the finish.** A short experiment gets finished, and a finished experiment is the one you learn from. The best argument I know for it comes from a ceramics class, where the teacher graded half the students on the quantity of pots produced and half on the quality of a single pot:

> Well, came grading time and a curious fact emerged: **the works of highest quality were all produced by the group being graded for quantity.** It seems that while the "quantity" group was busily churning out piles of work — and learning from their mistakes — the "quality" group had sat theorizing about perfection, and in the end had little more to show for their efforts than grandiose theories and a pile of dead clay.
> — David Bayles and Ted Orland, *Art & Fear*
