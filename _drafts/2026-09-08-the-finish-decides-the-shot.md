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

Product development runs the same way. Everything before contact is the work to get something into production. Contact is the launch. The follow-through is everything after: finding out whether it worked, then acting on the answer.

Golfers don't finish the swing for show. Committing to the full motion is what keeps the club accelerating through impact. Plan to stop at the ball and your swing slows, the trajectory at contact is altered, and the ball goes somewhere you didn't aim. **The finish decides the shot before the ball is ever struck.** A team that plans to stop at launch pulls up short the same way, and the experiment shrinks before it ever ships.

There is one honest way to shorten the finish, and the difference is that you choose it. The punch shot is played with a truncated follow-through to keep the ball low under the wind. It works. It also travels shorter, and every golfer who hits one knows the result will be smaller before they swing. That is intentional debt: priced, on the books, chosen before the swing.

Look at what we call the follow-through in software development. **Cleanup.** A word for the thing you do *after* the real work, if there's time, and the first thing cut when there isn't. "Cleanup goes in the backlog" is a sentence every engineer has heard, and the backlog is where it goes to rot. Nobody calls a mortgage payment tidying up. Uncle Bob draws the line:

> A mess is not a technical debt. A mess is just a mess. Technical debt decisions are made based on real project constraints. They are risky, but they can be beneficial. The decision to make a mess is never rational, is always based on laziness and unprofessionalism, and has no chance of paying off in the future. **A mess is always a loss.**
> — Robert C. Martin, *[A Mess is not a Technical Debt](https://sites.google.com/site/unclebobconsultingllc/a-mess-is-not-a-technical-debt)*

Cut the follow-through when you mean to, and price what you're giving up. Finding out afterward that you played a punch shot is how you end up with a mess.

## One Swing, Two Outcomes

Every swing's purpose is to make the shot, and most of our shots are misses. Anywhere from [half](https://www.svpg.com/the-inconvenient-truth-about-product/) to [two thirds](https://www.exp-platform.com/Documents/2015%20Online%20Controlled%20Experiments_EncyclopediaOfMLDM.pdf) of our experiments should be *expected* to fail. Either way, the follow-through is ours to plan.

The follow-through for a miss and for a success are different jobs. If we're right, we pay for a migration onto the new path. If we're wrong, we pay to remove what we built, and write down what we learned. Neither outcome can be known in advance, and neither was in the original estimate.

The success case gets done, because somebody in the business wants the new thing and will keep asking until the old path is gone. The failure case is the common one, and it has nobody asking. It is also the case where the entire value of the experiment is sitting in the finish. A team that can only run the plan it wrote before it knew anything will default to the yes path, because that is the path the plan describes.

A failed experiment delivers value only if somebody closes it out. Do it well and you leave behind the abstraction that makes the next experiment faster, plus what you learned about the market, the technology and the approach, distributed back into the organization instead of filed in a post-mortem nobody opens. I've called that [composting]({% post_url 2026-02-05-the-greenhouse-innovation-incubator %}).

Skip it and the complexity stays. Every experiment adds complexity until we know the answer: two implementations of the same thing, a flag still sitting in the code. Until the follow-through completes, the system is more complicated than the business needs it to be.

## Why the Finish Goes Missing

I keep expecting the causes to be interesting and they never are. Planning so far ahead that the finish falls outside the horizon. Not renegotiating a timeline that stopped being true weeks ago. Both have the same root: nobody in the business is asking for the finish, so it never wins a prioritization argument on its own merits.

Whether the finish ever happens usually depends on how much impact the experiment had, not on how much work it left behind. A big result gets a sponsor. A small one gets cleared and forgotten. Six foam-shedding events on the shuttle's external tank preceded Columbia. The last one before the accident dented the strut ring by about four inches, was raised at the next mission's flight readiness review, and was cleared as not a safety-of-flight issue. The seventh produced [29 recommendations](https://www.nasa.gov/history/columbia-accident-investigation-board-synopsis/). Six small results, six clearances. One big one, and the finish finally happened.

The standard advice about experimenting well makes this worse. Amy Edmondson's four markers of intelligent failure are that it's in new territory, it's in pursuit of a goal, you've done your homework, and the failures that occur are small and not dangerous. That last one describes the lowest-impact outcome available. **So the experiments most worth running are exactly the ones nothing will ever demand a finish for.** Her markers are all about designing the experiment. Not one of them concerns what you do once the result comes back.

A small result produces no completion moment either. I've made that argument from the other end: [a team that never gets to the end of anything has nothing to celebrate, and the behavior goes extinct]({% post_url 2026-08-07-recognition-is-infrastructure %}). Tanya Reilly calls the work that holds a team together and earns nobody a promotion [glue](https://www.noidea.dog/glue). Finishing a small failed experiment is glue: no feature, no demo, no line on the packet. Which is exactly why it's the swing to practice. **What a team does well on small projects is what it does great on big ones.** The finish you build as a habit on experiments nobody is watching is the finish you'll have when the big one lands.

The psychology is just as predictable, which is why the answer has to be design rather than encouragement. David Marquet:

> This aversion to stopping the clock spills over to an aversion to complete. We are programmed to continue — continue the work, continue on to the next task.
> — L. David Marquet, *[Leadership Is Language](https://www.penguinrandomhouse.com/books/566179/leadership-is-language-by-l-david-marquet/)*

Anything that already exists defends itself. An in-flight project defends itself against its own replacement, and a shipped feature defends itself against its own removal, which is why removing something released is harder than building it was.

## Unfinished Work Teaches Hesitation

Everyone has watched a follow-through go into the backlog and stay there, so "we'll clean that up after" stops sounding true. Nobody refuses the work. What shows up instead is trepidation: the proposal that sits a week longer than it needed to, the spike that gets discussed in three meetings and started in none, the scope quietly trimmed so there's less to unwind later.

The experiments that do run are slower, too. Every open experiment slows the next one: another thing to hold in your head, another question a new engineer has to ask before they can change anything. The experiment nobody closed out makes the next one slower, and the one after that slower still.

One more cost, and it's the one I missed for years. **A hedged swing returns a false answer.** When the team has no confidence the follow-through will happen, they place a smaller, more timid version of the experiment, and it fails for reasons that have nothing to do with the hypothesis. An underpowered test mostly produces false negatives, what statisticians call Type II errors, and they hide: a false negative looks like a negative result rather than bad methodology. The organization files it as a failed idea, and the hypothesis it was built to test never got an answer.

## Accelerate Through Impact

A plan that stops at launch is half a decision. Drucker got here in 1967:

> Unless a decision has "degenerated into work" it is not a decision; it is at best a good intention.
> — Peter Drucker, *[The Effective Decision](https://hbr.org/1967/01/the-effective-decision)*

What Drucker doesn't cover is the unwinding. His process builds the action into the decision and then tests whether the decision was right, and it never asks what happens to the thing you built when the answer comes back no. Two years ago I wrote that [the third commitment of my development process is closing the loop]({% post_url 2024-04-13-the-commit-cycle %}). I had the sequence right and the weighting wrong.

So a proposal that can be finished answers three questions: why we're doing this, how we'll know if we're right, and what happens next either way. Most teams get partial credit on the first two. The third gets waved through.

The finish belongs in that same proposal, on that same timeline, decided while the team still wants to run the experiment. Not scheduled separately, and not "revisited later." A meta-analysis of if-then plans found that deciding in advance [raises the odds you follow through](https://cancercontrol.cancer.gov/sites/default/files/2020-06/goal_intent_attain.pdf) by a medium-to-large effect. Annie Duke's version in *Quit* points the same mechanism at exits: deciding in advance is what makes the exit survive the moment you need it. Before a rebrand, we laid out the timeline with the post-release feature flag work written into it. It was in the plan, so it happened.

When the finish turns out to cost more than you planned, renegotiate rather than absorb. Either finish it in a way that settles the question for good, or go ask for what finishing it requires. Absorbing it quietly is how it ends up in the backlog.

The lever nobody reaches for is the experiment itself. Shorten the experiment, not the finish. The best argument I know for it is a ceramics class, where the teacher graded half the students on the quantity of pots produced and half on the quality of a single pot:

> Well, came grading time and a curious fact emerged: **the works of highest quality were all produced by the group being graded for quantity.** It seems that while the "quantity" group was busily churning out piles of work — and learning from their mistakes — the "quality" group had sat theorizing about perfection, and in the end had little more to show for their efforts than grandiose theories and a pile of dead clay.
> — David Bayles and Ted Orland, *Art & Fear*

Shorter experiments get finished, because the finish stays small enough to fit inside the plan.

Sometimes you abort. The answer arrives early, or the ground shifts, and you pull up before contact. Stop there without a finish and you still get an outcome, one nobody chose: the flag still in the code, two implementations still running, a system built around a question that never got resolved either way. The stop call cannot belong to the person running the experiment. Barry Staw's "Knee Deep in the Big Muddy" found that people held personally responsible for a failing decision escalate their commitment to it more than people who inherited the same mess. The person who ran the experiment is the worst available judge of when to kill it, and the more of their identity is riding on the result, the worse that judgment gets.

Bailing out earns nothing on its own, either. X, Alphabet's moonshot lab, [pays bonuses to teams that kill their own projects](https://www.ted.com/talks/astro_teller_the_unexpected_benefit_of_celebrating_failure). Cool-down weeks between cycles, where nothing is scheduled, are the same admission in friendlier clothes. Both fund the finish on a swing that never reached the ball.

Every team already writes down what "done" means, and the finish is not in the definition. The Scrum Guide defines Done as "a formal description of the state of the Increment when it meets the quality measures required for the product," and adds that "the moment a Product Backlog item meets the Definition of Done, an [Increment is born](https://scrumguides.org/scrum-guide.html)." Quality measures on the thing built. Nothing about business outcome, nothing about removal. My own organization made the same move from the other direction when it scored verification outside the work.

Engineering is a profession of creating *and* reducing complexity, and the job is keeping a system only as complicated as the business it runs. **Done is when the system's complexity is back in line with what the business actually needs**, whichever way the answer came out.

Go open your team's definition of done. Count how many of its lines describe the thing you built, and how many describe the state you're leaving the system in.
