# Contributing to GAP 

We invite everyone to contribute by submitting patches,
pull requests, and bug reports. We would like to make the contributing
process as easy as possible.

## Issue reporting and code contributions

* Before you report an issue, or wish to add functionality, please try
  and check to see if there are existing
  [issues](https://github.com/gap-system/gap-git/issues) or
  [pull requests](https://github.com/gap-system/gap-git/pulls).
  We do not want you wasting your time duplicating somebody else's work.
* For substantial changes it is also advisable to contact us before
  you start work to discuss your ideas.
* You should be prepared to wait until your pull request or patch
  has been discussed and authorized prior to its inclusion. We might
  also ask for you to adapt your changes to make them suitable for 
  inclusion.
* To help increase the chance of your pull request being accepted:
  * Run the tests.
  * Update the documentation, tests, examples, guides, and whatever
    else is affected by your contribution.
  * Use appropriate code formatting for both C and GAP.
* *The Campsite Rule*
  A basic rule when contributing to GAP is the **campsite rule**:
  leave the codebase in better condition than you found it.
  Please clean up any messes that you find, and don't
  leave behind new messes for the next contributor.

## Making Changes 

GAP development follows a straightforward branching model. We prefer using the github
infrastructure. If you would like to contribute, but do not want to create a github
account, see below for an alternative.

 * Make sure you are familiar with [Git](http://git-scm.com/book).
 * Make sure you have a [GitHub account](https://github.com/signup/free).
 * Make sure you are familiar with [GAP](http://www.gap-system.org/).
 * Fork our [main development repository](https://github.com/gap-system/gap) on github
 * Clone your fork to your local machine:

```
$ git clone git@github.com:<your github user name>/gap.git
```
 * Add `gap-system/gap` as a remote upstream
```
$ git remote add upstream git@github.com:gap-system/gap.git
```
 * Ensure your existing clone is up-to-date with current `HEAD` e.g.
```
$ git fetch upstream
$ git merge upstream/master
```
 * Create, and checkout onto, a topic branch on which to base you work.
   * This is typically done from the master branch.
   * For your own sanity, please avoid working on the `master` branch.
 ```
 $ git branch fix/master/my_contrib master
 $ git checkout fix/master/my_contrib
 ```
 * Make commits of logical units.
 * Check for unnecessary whitespace with
```
$ git diff --check
```
 * Make sure your commit messages are along the lines of:

        Short (50 chars or less) summary of changes

        More detailed explanatory text, if necessary.  Wrap it to about 72
        characters or so.  In some contexts, the first line is treated as the
        subject of an email and the rest of the text as the body.  The blank
        line separating the summary from the body is critical (unless you omit
        the body entirely); tools like rebase can get confused if you run the
        two together.

        Further paragraphs come after blank lines.

        - Bullet points are okay, too

        - Typically a hyphen or asterisk is used for the bullet, preceded by a
          single space, with blank lines in between, but conventions vary here

 * Make sure you have added any necessary tests for your changes.
 * Run all the tests to assure nothing else was accidentally broken.
```
$ make testinstall
$ make testall
```
 * Push your changes to a topic branch in your fork of the repository.
```
$ git push origin fix/master/my_contrib
```
 * Go to GitHub and submit a pull request to GAP

From there you will have to wait on one of the GAP committers to respond to the request.
This response might be an accept or some changes/improvements/alternatives will be suggested.
We do not guarantee that all requests will be accepted.

## Making changes without Github account

If you do not want to open a github account you can still clone the GAP repository
like so:
```
git clone https://github.com/gap-system/gap.git
```

Make your changes and commits, and use git's `send-email` feature to send us patches to
gap@gap-system.org.

## Additional Resources

* [GAP Tutorial](http://gap-system.org/Manuals/doc/tut/chap0.html)
* [GAP Manual](http://gap-system.org/Manuals/doc/ref/chap0.html)
* [GAP Homepage](http://www.gap-system.org/)
* [Using Pull Requests](https://help.github.com/articles/using-pull-requests)
* [General GitHub Documentation](https://help.github.com/)

Heavily adapted from the contributing files from the [Puppet project](https://github.com/puppetlabs/puppet),
[Factory Girl Rails](https://github.com/thoughtbot/factory_girl_rails/blob/master/CONTRIBUTING.md),
and [Idris](https://github.com/idris-lang/Idris-dev)
