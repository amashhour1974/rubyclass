Resources and Recommendations {.unnumbered}
===========================================

A helpful collection of tips and links to help you after the course.

Ruby Key Points to Remember {.unnumbered}
-----------------------------------------

  * Number one issue: watch out for values being `nil`.  One of the
    leading causes of failing applications in the wild are unexpected
    `nil` values.

  * If you must use exceptions, don't raise strings.  Create custom
    exception classes instead.

  * Restrict dependencies in your Gemfile to exact versions.  At the
    very least, always provide an upper bound on version
    specifications.  Your future self will thank you.

  * Test everything you possibly can with an automated test framework.
    Make sure the tests fail if the code changes, make sure the tests
    run automatically as necessary.

  * Mocking can lead to untested code.  Be careful when using test
    mocking.  Try to only mock code which is tested in some other way.

Ruby Information and Documentation {.unnumbered}
------------------------------------------------

  * [The Ruby Programming Language][ruby-book]

  * [Effective Ruby][]

  * [Ruby online documentation][ruby-doc]

  * [Main repository of RubyGems][gems]

  * [Official Ruby webpage][mri]

Ways to Practice Ruby {.unnumbered}
-----------------------------------

  * [Exercism.io][]

  * [Ruby Koans][]

  * [Codementor][]
