Introduction
------------

Cucumber has a rather unique perspective on testing.  It's one of a
small number of testing frameworks that attempts to bring the
stakeholders in on the software testing process.

In this section we'll take a look at what Cucumber is, why you should
consider using it, and what it's all about.

### What is Cucumber? ###

  * First and foremost, it's a testing framework

  * The actual test code is written using the RSpec library

  * Test are driven using an English-like language known as Gherkin

  * Non-technical stakeholders should be able to read the Gherkin and
    agree that the described features are correct

  * Cucumber was originally written in Ruby but now has wide adoption
    in many languages

### Why You Should Consider Using Cucumber ###

  * Testing is driven by use cases written in Gherkin (acceptance testing)

  * Writing use cases first results in Behavior-driven development

  * Often, new tests can be written in Gherkin without requiring coding

### Components of Cucumber Tests ###


Gherkin
  : Used to describe use cases (features) and specific tests of those
    features (scenarios).  When tests are executed the details from
    the scenarios are fed into *step definitions* where code can
    verify the specifications.

Step Definitions
  : Helper methods, written in Ruby using RSpec, that are given
    specification details from the Gherkin scenarios.  The Ruby code
    uses expectations to verify the scenario details.
