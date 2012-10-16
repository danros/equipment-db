# Hacking on the code

Here are some informal guidelines for trying to make sure our project develops
a) quickly and b) in as high a quality manner as we can.

## Everything is a pull request

Even if you have access to push directly to master, please don't. If you send a
pull-request then that pull-request will automatically be built and the result
displayed at the bottom of the request as a large coloured bar. We use
[travis-ci](http://travis-ci.org) to build each pull-request and run the test
suite.

## Test all the things

Even if you're not doing [test-driven
development](http://en.wikipedia.org/wiki/Test_driven_development) we still
want lots of tests. The time between a commit hitting master and your code
working with real data is small. If your change is a refactor, we want some
assurance we're not going to bring the database down.

Any functional changes to models **must** have a test. Any changes to views or
controllers probably *should* have a test. Tests live under `spec/`. The name
is appropriate: in some sense they are the spec. They should read like a set of
expected behaviour that one could (almost) use in place of documentation.

## Fork off

Ideally you'll fork the main repo, push a change up to a personal branch (after
setting up travis to build your personal repo too) and then send a pull
request. This makes the history of the `master` branch far prettier and lets us
make the 'Network' tab on Github look very pretty indeed.

