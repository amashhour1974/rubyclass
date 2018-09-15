Scenarios and Steps
-------------------

At that heart of Cucumber is scenarios and step definitions.  Using
scenarios written in Gherkin we describe specific, testable details
about a feature.  Those details are given to step definitions, code
written in Ruby to do the actual testing.

<!--
  Questions:

  1) Can a feature file have more than one scenario? Yes.

  2) Can you wrap functions like Given in a module? :TODO:

  3) Is using instance variables the correct way to manage state? :TODO:

  4) Is cucumber using RSpec for the expectation language? Yes.

-->


### Feature Descriptions Written in Gherkin ###

~~~ {insert="../../src/examples/structuring/features/albums_by_year.feature" token="feature"}
~~~

### Using the Scenario Details in Ruby ###

  * Cucumber will load Ruby code from the `features/step_definitions`
    directory

  * Predefined methods are used to match the steps in a scenario and
    respond to them using a Ruby block

  * The `Given`, `When`, and `Then` methods use regular expressions or
    Cucumber expressions to match steps in a scenario

  * Unmatched steps are reported as a test failures

### Step Definition: `Given` ###

~~~ {.ruby
insert="../../src/examples/structuring/features/step_definitions/albums_by_year_steps.rb" token="given"}
~~~

### Step Definition: `When` ###

~~~ {.ruby
insert="../../src/examples/structuring/features/step_definitions/albums_by_year_steps.rb" token="when"}
~~~

### Step Definition: `Then` ###

~~~ {.ruby
insert="../../src/examples/structuring/features/step_definitions/albums_by_year_steps.rb" token="then"}
~~~

### Lab: Our First Cucumber Test ###

<div class="notes">

Let's revisit our discography application and write some Cucumber
tests for it.  We'll start out with the `Artist#albums` method.

</div>

In your discography application:

  #. Create a directory called `features`

  #. Create a file named `features/albums_by_year.feature`

  #. Write a Gherkin feature and scenario for the `Artist#albums` method

  #. Use the `cucumber` tool to run your tests


### Lab: Cucumber from Scratch ###

<div class="notes">

Now it's time to write a Cucumber test from scratch!

</div>


  #. Add another feature file to the `features` directory

  #. Test the `Artist#name` attribute accessor

  #. Use the `cucumber` tool to run your tests

### Testing with Example Data ###

What if you want to run the same scenario over and over again with
different values?

  * Update the scenario to use variables instead of specific values

  * Add an *examples* table to the scenarios

### Using Variables and Examples ###

~~~ {insert="../../src/examples/structuring/features/albums_by_year.feature" token="variables"}
~~~

### Lab: Variables and Examples ###

  #. Rewrite one of your scenarios to use variables and examples

  #. Use the `cucumber` tool to run your tests
