# Git Definitions

**Instructions:** Define each of the following Git concepts.

* What is version control?  Why is it useful?
	```
	Version control allows code changes to be discrete, incremental, and tracked throughout the coding processes. First, with version control, multiple users can work on the project at once, with each editing their own copy of the master version and merging their version to the master when a feature is implemented or a bug is fixed. Version control also helps prioritize small changes over sweeping ones, which further enables the tracking of when changes, including bugs, may have been introduced, so that those changes can be further adjusted as necessary.
	```
* What is a branch and why would you use one?
	```
	A branch is an offshoot from a git repository that can be modified independently of the main body of the code. By using a new branch to implement a feature or fix a bug, you minimize the risk of introducing untested sections of code into a larger project. Small incremental changes to branches rather than the main codebase allow multiple people to work on different aspects of a project while keeping all their edits separate; this makes it easy to track where new errors were introduced into the environment or to roll back to an earlier version if something doesn't work as intended.
	```
* What is a commit? What makes a good commit message?
	```
	A commit occurs when a branch of a git repository is updated with new or edited files. A good commit message explains what was added or edited and to what effect, so that future users or editors of the repository can quickly and easily trace when aspects of the repository were changed; to better facilitate this, commits should be incremental rather than sweeping.
	```
* What is a merge conflict?
	```
	A merge conflict can occur when one attempts to merge two branches that have diverged from a common base fork. If, for example, two people try to fix the same bug, they might edit the same lines but in different ways from each other and from the original base. Git then detects a merge conflict because the two later commits don't match, and it doesn't know which solution to use as the final answer in the main branch that is to the product of the original and merging branches.
	```