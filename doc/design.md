# Equipment Status Database

We expect to have quite a lot of equipment, and no matter how careful we are,
in practice we can expect some of it to go wrong sometimes.  It's been
suggested (at a founder members' meeting in the early setup stages) that we
could have a team (or committee, but they probably don't need to have meetings
much) of people who will look after the equipment.

Different pieces of equipment will have different maintenance requirements, and
possibly be maintained by different people.  We need a way to inform
maintainers that something needs attention.

A web-based equipment database could several useful types of information:

* Inventory of equipment
* Current status of each item (you can check whether the kit you need is working, before travelling to the space)
* Who maintains each item (with email address / SMS number)
* What to do if a machine goes wrong while you are using it
* Who is interested in status changes of each piece of equipment, to inform them by email

If a machine goes wrong while you're using it, you use the web interface
(perhaps there should be a "kiosk" machine in the space, for such brief
functions --- perhaps fixed to a wall for use while standing, to deter hogging
it for other uses?) to indicate this (perhaps with a brief description of the
problem) and the maintainer(s) for that machine will be notified.  You can
leave your email / SMS number as part of the report, so when a maintainer marks
the equipment as having been fixed, you will be notified.

## Fields

Fields that don't change often (perhaps administrator-edited only):

* Name of device
* Inventory number or RFID tag number, if we decide to use such things
* Normal location of device
* Owned by Makespace / lent to Makespace
** Owner
* Date acquired
* Maintainers
* What to do in case of problems
* Link to further information e.g. wiki page
* What training is needed to use this machine
* People trained to use this machine

Fields that vary more often:

* Status: one of:
** Working well
** Working but could use some TLC
** Just about working
** Broken
* Details of fault, if broken
* When repair is expected, if broken
* People interested in its status
* Date next routine servicing due
* Date next TAP test due

