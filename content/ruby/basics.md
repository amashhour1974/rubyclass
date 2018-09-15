Ruby Basics
===========

> Never memorize something that you can look up. -- Albert Einstein

Introduction
------------

<div class="notes">

Since we're going to be spending a few days together it's important to
understand the goals of the course, some background information on the
instructor, and what makes a good student.

</div>

### About this Course {time="00:05:00"}

  * Repetition is key

  * Making mistakes is a good thing

  * Knowing how to get unstuck is very important

  * Writing code is better than lectures

## A Little Bit About Ruby

<div class="notes">

Basic introduction to Ruby, it's past, and why it's different than
other programming languages.

### Learning Objectives {#rbintro-intro-objectives time="00:00:00"}

  * Review a brief history of Ruby, languages that have influenced it,
    and differences between its major releases (1.8, 2.0--2.4).

  * Understand the differences between the various interpreter
    implementations (e.g. MRI, JRuby, RubyMotion, etc.)

  * Consider competing technologies and languages, and know the
    reasons why Ruby stands out among them.

  * Familiarity with both Ruby's strengths and weaknesses.

</div>

### Brief History of Ruby {#rbintro-intro-history time="00:03:00"}

   * First released in 1995 by Japanese Programmer "Matz".
   * Syntax influenced by Perl (C-style).
   * Features influenced by Smalltalk and Lisp.
   * Modern Ruby began with v1.9 (2007).
   * Continued improvements in v2.0--v2.6.

### Interpreter Implementations {#rbintro-intro-interpreters time="00:03:00"}

<div class="notes">

Popular implementations of the Ruby programming languages:

</div>

   * [MRI] [] is the official implementation of Ruby.
   * [JRuby] [] is also very popular in enterprise environments.
   * [RubyMotion] [] was designed for Mac OS X and iOS.

<div class="notes">

Notes about [JRuby] []:

  * Pure Ruby implementation in Java.
  * Useful for environments that already have a full Java stack.
  * Currently supports *most* Ruby 1.9.3 features.
  * There are some small differences between MRI and JRuby.
  * To use a RubyGem it must be written in pure Ruby.
  * The tooling isn't as easy to use as MRI.

</div>

### Competing Languages and Technologies {#rbintro-intro-others time="00:03:00"}

  * Perl: The interpreted language of choice before Ruby.
  * Python: Popular alternative to Ruby.
  * PHP: Popular web language before Rails.
  * Elixir: Ruby-inspired language on the Erlang VM.

### Design Goals and Constraints {#rbintro-intro-design time="00:03:00"}

  * Optimized for developer performance.
  * Run-time performance varies by implementation.
  * The interpreter needs access to the source code.
  * General purpose language.
  * Garbage collected.

## Ruby Syntax Basics

<div class="notes">

First look at Ruby's syntax, playing around in IRB, and jumping right
in and writing code.

### Learning Objectives {#rbintro-basics-objectives time="00:00:00"}

  * Get acquainted with basic Ruby syntax.

  * Experiment with Ruby using `irb`.

  * Write a class definition and load it into `irb`.

  * Test a class definition using [MiniTest][].

</div>

### Working From the Command Line {time="00:02:00"}

We're going to spend a lot of time working from the command line.  For
today it's important to keep a few things separate in your head.

  * We'll be running commands from a terminal window

  * The `irb` tool allows us to type Ruby code into the terminal and
    evaluate it

  * When you start `irb` it will continue running until you type
    `exit` and press enter

  * It's best to keep two terminal windows available throughout the
    course

### Lab: Using the Ruby REPL

<div class="notes">

This instructor-led lab focuses on becoming familiar with basic Ruby
syntax and using the Ruby REPL (`irb`).

</div>

Start the Ruby REPL (known as `irb`) and follow along with the
instructor.

<div class="notes">

#### Demonstrations and Exercises {#rbintro-basics-lab1-demo time="00:10:00"}

  * Basic interaction and infix syntax:

    ~~~ {exec="../../src/examples/irb.sh"}
    1 + 2
    ~~~

  * Everything in Ruby is an object:

    ~~~ {exec="../../src/examples/irb.sh"}
    1.class
    ~~~

  * String literals (single and double quotes):

    ~~~ {exec="../../src/examples/irb-nil.sh"}
    "Hello World".class
    n = 1; nil
    s1 = "Number #{n + 1}"
    s2 = 'Number #{n + 1}'
    ~~~

  * Everything is mutable in Ruby:

    ~~~ {exec="../../src/examples/irb-nil.sh"}
    s = "Hello"
    s.insert(5, " World")
    ~~~

  * Well, almost everything:

    ~~~ {exec="../../src/examples/irb-nil.sh"}
    n = 1
    n += 1      # There's no n++ or ++n
    n = n + 1   # Above expands to this.
    ~~~

    Take a few moments and play with variables containing integers.
    Experiment with traditional operators.

  * Ruby automatically promotes fixed integers:

    ~~~ {exec="../../src/examples/irb-nil.sh"}
    (2 ** 32).class
    (2 ** 64).class
    ~~~

  * Ruby's no-value value:

    ~~~ {exec="../../src/examples/irb.sh"}
    nil
    ~~~

#### Key Points to Review {#rbintro-basics-lab1-key-points time="00:02:00"}

  * One reason everything is mutable is because classes in Ruby are
    always open.

  * Semicolons are optional.  Without a semicolon the current
    expression terminates at the end of a line (if the expression is
    complete).

  * Most uses of parentheses are optional.  Most Ruby programmers omit
    them, I'll present good evidence why you should always use them.

  * If you use parentheses, **do not insert a space between a method's
    name and the opening parenthesis**.

</div>

### Converting From One Type to Another {time="00:05:00"}

Most objects have methods whose names begin with `to_` for converting
the object into another type:

~~~ {exec="../../src/examples/irb.sh"}
1.to_s
"03".to_i
~~~

This is also a great way to guard against the `nil` value:

~~~ {exec="../../src/examples/irb.sh"}
nil.to_s
nil.to_i
~~~

### Object Oriented Programming {#rbintro-basics-oop time="00:10:00"}

~~~ {.ruby insert="../../src/examples/basics/syntax_test.rb" token="person"}
~~~
~~~ {.ruby insert="../../src/examples/basics/syntax_test.rb" token="new"}
~~~

<div class="notes">

  There's a lot packed into this example:

  * Ruby has a Perl-flavored, C-like syntax
  * Semicolons are optional (line-based syntax)
  * Whitespace is insignificant
  * Class names, module names, and constants use `CamelCase`
  * Variable and method names use `snake_case`
  * Blocks of code are delimited by `begin...end` or `do...end`
  * All methods return a value (no `void` functions)
  * Implicit return of final value
  * The scope of a variable is determined by its name
  * Variables that begin with "`@`" are instance variables
  * Instance variables are also called *attributes*
  * Global variables start with "`$`"
  * Instance variables are always private
  * Methods are public by default
  * Comments begin with a "`#`" character
  * New objects are created by using the `ClassName.new` syntax
  * Variables come into existence when you assign to them
  * Methods are called on receivers, the default receiver is `self`

</div>

### Ruby's Class Hierarchy {#rbintro-basics-hierarchy time="00:05:00"}

<div class="notes">

The following diagram illustrates why polymorphisim works in Ruby.  It
also shows why the `nil` value can replace any other value.

</div>

![](../../diagrams/classes.dot)

### Lab: Write a Class in Ruby

<div class="notes">

We'll use this lab to reinforce what we've learned while interacting
with `irb`.

</div>

Write a `CandyBar` class in the `candy_bar.rb` file.  The `initialize`
method should take a single argument, the name of the candy bar.
Instances of the `CandyBar` class should have the following features:

  #. A `name` method that returns the name of the candy bar.

  #. A `bites` method that returns the number of bites remaining.
     The number of available bites should start at `5`.

  #. A `bite` method that reduces the number of remaining bites.

Save your file, then go back to the terminal.  Use the `cd` command to
navigate to the folder where you saved the file and run the following
command:

    irb -w -I. -rcandy_bar.rb

<div class="notes">

Noteworthy points:

  * There's no connection between the name of a file and what it
    contains.

  * Ruby programmers tend put each class into its own file, but that's
    just a convention.

### Reference Implementation {time="00:05:00"}

~~~ {.ruby insert="../../src/examples/basics/candy_bar_test.rb" token="candy_bar"}
~~~

</div>

### Lab: Unit Testing with MiniTest {time="00:08:00"}

  #. Create a new file for writing a unit test.  Call the file
     `candy_bar_test.rb`.

  #. Use the following code as a template.

~~~ {.ruby insert="../../src/examples/basics/candy_bar_test.rb" token="require"}
~~~
~~~ {.ruby}
require('candy_bar')
~~~
~~~ {.ruby insert="../../src/examples/basics/candy_bar_test.rb" token="candy_bar_test"}
~~~

### Lab: Unit Testing with MiniTest {time="00:08:00"}

  #. Write a test to make sure that `bites` starts out at 5.

  #. Use the following example as a guide.

  #. Execute the test file: `ruby -w -I. candy_bar_test.rb`

~~~ {.ruby insert="../../src/examples/basics/candy_bar_test.rb" token="initial"}
~~~

### Lab: Unit Testing with MiniTest

<div class="notes">

This lab we'll expose us to testing with the MiniTest framework.

</div>


Write more tests to confirm:

  #. The `bite` method reduces the number of bites available.

  #. The `name` method correctly returns the name of the candy bar.

  #. Execute the test file: `ruby -w -I. candy_bar_test.rb`

<div class="notes">

### Reference Implementation {#rbintro-basics-lab3-done time="00:05:00"}

~~~ {.ruby insert="../../src/examples/basics/candy_bar_test.rb" token="bites"}
~~~
~~~ {.ruby insert="../../src/examples/basics/candy_bar_test.rb" token="name"}
~~~

</div>

## Beyond Basic Syntax

<div class="notes">

Now that we've been exposed to basic Ruby syntax, it's time to add
more idioms to our knowledge.

### Learning Objectives {time="00:00:00"}

  * Introduce attribute accessors

  * Understand the difference between strings and symbols

  * Introduce Ruby conditional expressions (`if` and `unless`)

  * Learn about how Ruby uses the iterator pattern

</div>

### Funny Method Names Part 1 {time="00:03:00"}

Ruby allows us to use a few special characters at the end of a method.
One of those characters is the equal sign (`=`).  For example:

~~~ {.ruby}
def name=(value)
  # ...
end
~~~

Remember this: the equal sign is part of the method's name.

### Getters and Setters {time="00:03:00"}

<div class="notes">

We currently have something like the following:

</div>

~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="getter"}
~~~
~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="getter-example"}
~~~

### Adding a Setter Method {time="00:05:00"}

<div class="notes">

Let's add a way to change the candy bar's name.

</div>

~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="setter"}
~~~
~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="setter-example"}
~~~

### Warnings For Setter Methods {time="00:05:00"}

*Warning:* Setter methods must always have a receiver!

~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="warning"}
~~~

### Helper Methods For Writing Accessor Methods {time="00:05:00"}

There's a family of helper methods that start with "`attr_`":

~~~ {.ruby}
attr_reader('name')   # Create the "getter" method.
attr_writer('name')   # Create the "setter" method.
attr_accessor('name') # Create both.
~~~

### Lab: Clean Up the `CandyBar` Class Using Accessors

<div class="notes">

We're going to add attribute accessors to the `CandyBar` class.

</div>


  #. Update your `CandyBar` class so that it uses attribute accessors
     wherever possible (hint: `@bites` and `@name`).

  #. Remove any methods that were acting as getter methods.

  #. Make sure tests still pass after changing the `CandyBar` class.

  #. Add the ability to change the name of a candy bar.  Write a test
     to make sure it works as expected.

<div class="notes">

### Reference Implementation {time="00:05:00"}

~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="with-accessors"}
~~~

</div>

### A Slight Improvement: Using Symbols {time="00:05:00"}

What's the difference between the following?

~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="with-string"}
~~~
~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="with-symbol"}
~~~

<div class="notes">

For now, if you're having a hard time understanding symbols, pretend
that they're a special type of string.

</div>

### Lab: Experimenting with Symbols

<div class="notes">

This is an opportunity to open `irb` and experiment with the
differences between strings and symbols.

</div>


Start `irb` and follow along.

<div class="notes">

#### Demonstration of Symbols {time="00:05:00"}

  * Symbols are instances of a class too:

    ~~~ {exec="../../src/examples/irb.sh"}
    :name.class
    ~~~

  * Converting between strings and symbols:

    ~~~ {exec="../../src/examples/irb.sh"}
    :name.class
    :name.to_s
    "name".to_sym
    ~~~

  * New strings always allocate memory, symbols don't:

    ~~~ {exec="../../src/examples/irb.sh"}
    "name".object_id == "name".object_id
    :name.object_id  == :name.object_id
    ~~~

</div>

### Lab: Replacing Strings with Symbols

<div class="notes">

Let's go back and update our `CandyBar` class with the information now
known about symbols.

</div>


Edit your `CandyBar` class:

  #. Change all arguments to the `attr_` methods to be symbols.

  #. Make sure your tests still pass.

### Funny Method Names Part 2 {time="00:03:00"}

Ruby allows us to use a few special characters at the end of a method.
One of those characters is the question mark (`?`).  For example:

~~~ {.ruby}
def excited?
  # ...
end
~~~

The question mark doesn't mean anything to Ruby (unlike when we used
an equal sign in a method's name).  Traditionally, Ruby programmers
use it when writing predicate functions.  **Remember this:** the
question mark is part of the method's name.

### Conditional Expressions (`if...end`) {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/syntax/conditional_test.rb" token="only-if"}
~~~

### Conditional Expressions (`if...elsif...else...end`) {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/syntax/conditional_test.rb" token="full-if"}
~~~

### Conditional Expressions: (`if` modifier) {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/syntax/conditional_test.rb" token="if-mod"}
~~~

### Conditional Expressions: Assignment Works! {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/syntax/conditional_test.rb" token="if-assign"}
~~~

### Conditional Expressions: (`unless`) {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/syntax/conditional_test.rb" token="if-or-unless"}
~~~

### Loops vs. the Iterator Pattern {time="00:05:00"}

Iterating over a list of values often looks like this:

~~~ {.java}
for (int i=0; i<100; ++i) { /* ... */ }
~~~

Ruby uses the *Iterator Pattern* instead:

~~~ {.ruby insert="../../src/examples/syntax/iterator_test.rb" token="times"}
~~~

<div class="notes">

Noteworthy points:

  * A block of code is given to a method.

  * The method can invoke that block any number of times (including
    zero).

  * When the method invokes the block it can pass it arguments.

  * Invoking a block is referred to as *yielding*.

</div>

### Lab: Improving the `CandyBar` class

<div class="notes">

Let's use what we just learned about Ruby conditionals and the
iterator pattern and apply that knowledge to improving the `CandyBar`
class.

</div>

Make the following changes to your `CandyBar` class and test:

  #. Change the `bite` method so that the number of remaining bites
     cannot drop below zero.

  #. Write a test that calls the `bite` method $N+1$ times and ensure
     that the remaining number of bites never drops below zero.  $N$
     should be the number of possible bites in a new candy bar.

<div class="notes">

### Reference Implementation {time="00:05:00"}

~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="bite-if"}
~~~
~~~ {.ruby insert="../../src/examples/syntax/candy_bar_test.rb" token="bite-test"}
~~~

</div>

Core Collection Classes
-----------------------

<div class="notes">

Introduction to more of Ruby's core classes such as `Array` and
`Hash`.

### Learning Objectives {time="00:00:00"}

  * Introduction to the Array class

  * Using the Array class in IRB and source files

  * Introduction to the Hash class

  * Practical applications of the Hash class

  * Viewing Ruby documentation (terminal- and web-based)

</div>

### Lab: Experimenting with the Array Class in IRB

<div class="notes">

We'll jump right in and start playing with the `Array` class using
`irb`.

</div>


Open `irb` and follow along.

<div class="notes">

#### Demonstrations and Exercises {time="00:10:00"}

  * Create a new `Array` (explicit syntax):

    ~~~ {exec="../../src/examples/irb.sh"}
    a = Array.new
    a.push(1)
    a << "Hello"
    a.size
    a[0]
    a.first
    ~~~

  * Create a new `Array` (array literal):

    ~~~ {exec="../../src/examples/irb.sh"}
    a = [1, "Hello"]
    a.size
    a[1]
    ~~~

</div>

### Reading Ruby Documentation {time="00:05:00"}

Read `Array` documentation from the command line:

~~~
ri Array
~~~

Or from your web browser:

<http://ruby-doc.org/>

<div class="notes">

If you're using JRuby instead of MRI, the following commands need to
be run in order to read documentation from the command line:

~~~
jruby -S gem install rdoc-data
jruby -S rdoc-data --install
~~~

</div>

### A Note About Notation {time="00:03:00"}

When reading Ruby documentation the distinction between class-level
and instance-level methods is made by using either the "`::`"
separator or "`#`".  For example:

| Notation     | Meaning                                           |
|--------------+---------------------------------------------------|
| `Array::new` | The `new` class method from the `Array` class     |
| `Array#size` | The `size` instance method from the `Array` class |

### Another Look at the Iteration Pattern {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/core_classes/iterator_test.rb" token="array-iterator"}
~~~

### Block Return Values Sometimes Matter {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/core_classes/iterator_test.rb" token="array-select"}
~~~

### Lab: From Bites to Percentages

<div class="notes">

Let's introduce arrays into our `CandyBar` classes by keeping track of
the number of bites as a percentage of the whole candy bar.

</div>

We're switching from keeping track of the number of bites to tracking
the percentage eaten with each bite.

  #. Remove the getter method for `@bites`.

  #. In the `initialize` method, replace `@bites` with an empty array.

  #. The `bite` method should take a value between `0.0` and `1.0` and
     add that value to the `@bites` array as long as the total doesn't
     go over `1.0`.

  #. The `bites` method should return the percentage remaining.

  #. Update the tests.

<div class="notes">

### Reference Implementation {time="00:05:00"}

~~~ {.ruby insert="../../src/examples/core_classes/candy_bar_test.rb" token="using-array"}
~~~

</div>

### Lab: Experimenting with the Hash Class in IRB

<div class="notes">

Now it's time to turn our attention to Hashes!

</div>

Open `irb` and follow along.

<div class="notes">

#### Demonstrations and Exercises {time="00:10:00"}

  * Create a new `Hash` (explicit syntax):

    ~~~ {exec="../../src/examples/irb.sh"}
    h = Hash.new
    h["key"] = "value"
    h.size
    ~~~

  * Create a new `Hash` (explicit syntax):

    ~~~ {exec="../../src/examples/irb.sh"}
    h = Hash.new
    h[:key] = "value"
    h.size
    h[:key]
    ~~~

  * Create a new `Hash` (hash literal):

    ~~~ {exec="../../src/examples/irb.sh"}
    h = {"key" => "value"}
    h.size
    h["key"]
    ~~~

  * Alternative `Hash` syntax literal:

    ~~~ {exec="../../src/examples/irb.sh"}
    h = {key: "value"}
    h.size
    ~~~

</div>

### Tricks for Accessing Hash Entries {time="00:05:00"}

  * Create a hash using literal "hash rocket" syntax:

    ~~~ {.ruby}
    h = {"Jan" => 1, "Feb" => 2}
    ~~~

  * Get a value using a key:

    ~~~ {exec="../../src/examples/irb-nil.sh|tail -2"}
    h = {"Jan" => 1, "Feb" => 2}; nil
    h["Jan"]
    ~~~

  * Check if an entry exists:

    ~~~ {exec="../../src/examples/irb-nil.sh|tail -2"}
    h = {"Jan" => 1, "Feb" => 2}; nil
    h.has_key?("Jan")
    ~~~

### Two Ways to Treat a Hash Like an Array {time="00:05:00"}

  * Create a hash using literal "hash rocket" syntax:

    ~~~ {.ruby}
    h = {"Jan" => 1, "Feb" => 2}
    ~~~

  * Get an array of all of the keys:

    ~~~ {exec="../../src/examples/irb-nil.sh|tail -2"}
    h = {"Jan" => 1, "Feb" => 2}; nil
    h.keys
    ~~~

  * Get an array of all of the values:

    ~~~ {exec="../../src/examples/irb-nil.sh|tail -2"}
    h = {"Jan" => 1, "Feb" => 2}; nil
    h.values
    ~~~

### Lab: The Community `CandyBar`

<div class="notes">

Now that we know the ins and outs of hashes, let's put them to good
use.  We'll update the `CandyBar` class so we can track who is taking
the bites.

</div>

  #. Change the `@bites` variable so that it's a `Hash` instead of an
    `Array`.

  #. Update the `bite` method so that it takes two arguments, the
     percentage bitten and the name of the person taking the bite.

  #. If someone new is taking their first bite, the `bite` method
     should add them to the `@bites` hash.  If the name is already in
     the hash then add their bites together.

  #. Update all of the code that assumes `@bites` is an array.

  #. Update your tests.  You should shouldn't be able to eat more than
     100% of the candy bar.

<div class="notes">

### Reference Implementation {time="00:05:00"}

~~~ {.ruby insert="../../src/examples/core_classes/candy_bar_test.rb" token="using-hash"}
~~~

</div>
