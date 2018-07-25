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
   * Continued improvements in v2.0--v2.4.

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

    ~~~ {exec="../src/examples/irb.sh"}
    1 + 2
    ~~~

  * Everything in Ruby is an object:

    ~~~ {exec="../src/examples/irb.sh"}
    1.class
    ~~~

  * String literals (single and double quotes):

    ~~~ {exec="../src/examples/irb-nil.sh"}
    "Hello World".class
    n = 1; nil
    s1 = "Number #{n + 1}"
    s2 = 'Number #{n + 1}'
    ~~~

  * Everything is mutable in Ruby:

    ~~~ {exec="../src/examples/irb-nil.sh"}
    s = "Hello"
    s.insert(5, " World")
    ~~~

  * Well, almost everything:

    ~~~ {exec="../src/examples/irb-nil.sh"}
    n = 1
    n += 1      # There's no n++ or ++n
    n = n + 1   # Above expands to this.
    ~~~

    Take a few moments and play with variables containing integers.
    Experiment with traditional operators.

  * Ruby automatically promotes fixed integers:

    ~~~ {exec="../src/examples/irb-nil.sh"}
    (2 ** 32).class
    (2 ** 64).class
    ~~~

  * Ruby's no-value value:

    ~~~ {exec="../src/examples/irb.sh"}
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

~~~ {exec="../src/examples/irb.sh"}
1.to_s
"03".to_i
~~~

This is also a great way to guard against the `nil` value:

~~~ {exec="../src/examples/irb.sh"}
nil.to_s
nil.to_i
~~~

### Object Oriented Programming {#rbintro-basics-oop time="00:10:00"}

~~~ {.ruby insert="../src/examples/basics/syntax_test.rb" token="person"}
~~~
~~~ {.ruby insert="../src/examples/basics/syntax_test.rb" token="new"}
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

![](../diagrams/classes.dot)

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

~~~ {.ruby insert="../src/examples/basics/candy_bar_test.rb" token="candy_bar"}
~~~

</div>

### Lab: Unit Testing with MiniTest {time="00:08:00"}

  #. Create a new file for writing a unit test.  Call the file
     `candy_bar_test.rb`.

  #. Use the following code as a template.

~~~ {.ruby insert="../src/examples/basics/candy_bar_test.rb" token="require"}
~~~
~~~ {.ruby}
require('candy_bar')
~~~
~~~ {.ruby insert="../src/examples/basics/candy_bar_test.rb" token="candy_bar_test"}
~~~

### Lab: Unit Testing with MiniTest {time="00:08:00"}

  #. Write a test to make sure that `bites` starts out at 5.

  #. Use the following example as a guide.

  #. Execute the test file: `ruby -w -I. candy_bar_test.rb`

~~~ {.ruby insert="../src/examples/basics/candy_bar_test.rb" token="initial"}
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

~~~ {.ruby insert="../src/examples/basics/candy_bar_test.rb" token="bites"}
~~~
~~~ {.ruby insert="../src/examples/basics/candy_bar_test.rb" token="name"}
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

~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="getter"}
~~~
~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="getter-example"}
~~~

### Adding a Setter Method {time="00:05:00"}

<div class="notes">

Let's add a way to change the candy bar's name.

</div>

~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="setter"}
~~~
~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="setter-example"}
~~~

### Warnings For Setter Methods {time="00:05:00"}

*Warning:* Setter methods must always have a receiver!

~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="warning"}
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

~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="with-accessors"}
~~~

</div>

### A Slight Improvement: Using Symbols {time="00:05:00"}

What's the difference between the following?

~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="with-string"}
~~~
~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="with-symbol"}
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

    ~~~ {exec="../src/examples/irb.sh"}
    :name.class
    ~~~

  * Converting between strings and symbols:

    ~~~ {exec="../src/examples/irb.sh"}
    :name.class
    :name.to_s
    "name".to_sym
    ~~~

  * New strings always allocate memory, symbols don't:

    ~~~ {exec="../src/examples/irb.sh"}
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

~~~ {.ruby insert="../src/examples/syntax/conditional_test.rb" token="only-if"}
~~~

### Conditional Expressions (`if...elsif...else...end`) {time="00:03:00"}

~~~ {.ruby insert="../src/examples/syntax/conditional_test.rb" token="full-if"}
~~~

### Conditional Expressions: (`if` modifier) {time="00:03:00"}

~~~ {.ruby insert="../src/examples/syntax/conditional_test.rb" token="if-mod"}
~~~

### Conditional Expressions: Assignment Works! {time="00:03:00"}

~~~ {.ruby insert="../src/examples/syntax/conditional_test.rb" token="if-assign"}
~~~

### Conditional Expressions: (`unless`) {time="00:03:00"}

~~~ {.ruby insert="../src/examples/syntax/conditional_test.rb" token="if-or-unless"}
~~~

### Loops vs. the Iterator Pattern {time="00:05:00"}

Iterating over a list of values often looks like this:

~~~ {.java}
for (int i=0; i<100; ++i) { /* ... */ }
~~~

Ruby uses the *Iterator Pattern* instead:

~~~ {.ruby insert="../src/examples/syntax/iterator_test.rb" token="times"}
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

~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="bite-if"}
~~~
~~~ {.ruby insert="../src/examples/syntax/candy_bar_test.rb" token="bite-test"}
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

    ~~~ {exec="../src/examples/irb.sh"}
    a = Array.new
    a.push(1)
    a << "Hello"
    a.size
    a[0]
    a.first
    ~~~

  * Create a new `Array` (array literal):

    ~~~ {exec="../src/examples/irb.sh"}
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

~~~ {.ruby insert="../src/examples/core_classes/iterator_test.rb" token="array-iterator"}
~~~

### Block Return Values Sometimes Matter {time="00:03:00"}

~~~ {.ruby insert="../src/examples/core_classes/iterator_test.rb" token="array-select"}
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

~~~ {.ruby insert="../src/examples/core_classes/candy_bar_test.rb" token="using-array"}
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

    ~~~ {exec="../src/examples/irb.sh"}
    h = Hash.new
    h["key"] = "value"
    h.size
    ~~~

  * Create a new `Hash` (explicit syntax):

    ~~~ {exec="../src/examples/irb.sh"}
    h = Hash.new
    h[:key] = "value"
    h.size
    h[:key]
    ~~~

  * Create a new `Hash` (hash literal):

    ~~~ {exec="../src/examples/irb.sh"}
    h = {"key" => "value"}
    h.size
    h["key"]
    ~~~

  * Alternative `Hash` syntax literal:

    ~~~ {exec="../src/examples/irb.sh"}
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

    ~~~ {exec="../src/examples/irb-nil.sh|tail -2"}
    h = {"Jan" => 1, "Feb" => 2}; nil
    h["Jan"]
    ~~~

  * Check if an entry exists:

    ~~~ {exec="../src/examples/irb-nil.sh|tail -2"}
    h = {"Jan" => 1, "Feb" => 2}; nil
    h.has_key?("Jan")
    ~~~

### Two Ways to Treat a Hash Like an Array {time="00:05:00"}

  * Create a hash using literal "hash rocket" syntax:

    ~~~ {.ruby}
    h = {"Jan" => 1, "Feb" => 2}
    ~~~

  * Get an array of all of the keys:

    ~~~ {exec="../src/examples/irb-nil.sh|tail -2"}
    h = {"Jan" => 1, "Feb" => 2}; nil
    h.keys
    ~~~

  * Get an array of all of the values:

    ~~~ {exec="../src/examples/irb-nil.sh|tail -2"}
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

~~~ {.ruby insert="../src/examples/core_classes/candy_bar_test.rb" token="using-hash"}
~~~

</div>

Practical Ruby
==============

> Somewhere, something incredible is waiting to be known. -- Carl
> Sagan

Functional Programming and the Enumerable Module
------------------------------------------------

<div class="notes">

The `Enumerable` module contains a wealth of functionality for working
with collections of objects.  Knowing how the methods defined in the
`Enumerable` module become part of the collection classes like `Array`
and `Hash` is important, as is knowing what those methods do.  This
lesson will focus on modules as a way to share code and the
`Enumerable` module in general.

### Learning Objectives {time="00:00:00"}

  * Learn how modules can be used to share code

  * Understand how `Array` and `Hash` use `Enumerable`

  * Work though some of the methods in `Enumerable`

  * Tie `Enumerable` methods to concepts in functional programming

</div>

### Using Modules to Share Code {time="00:03:00"}

  * Modules are defined like classes

  * They can contain methods

  * They can not use inheritance, or be instantiated

  * They can be *included* into other classes

  * Almost like an interface, but not quite

### Introduction to the `Enumerable` Module {time="00:03:00"}

  * The `Enumerable` module contains many methods for working with a
    collection of objects

  * Both the `Array` and the `Hash` class include the `Enumerable`
    module

  * Let's take a look at the [documentation] [enumerable]

  * If your class has a working `each` method then you can include the
    `Enumerable` module

### Closer Look: The `map` Method {time="00:05:00"}

![](../diagrams/map.dot)

<div class="notes">

Noteworthy points:

  * The `map` method can't change the size of the array

  * In other words, it creates an array that has the same number of
    elements as the source array

  * The block given to `map` acts on a single element, transforming
    the element from source array to the destination array

</div>

### Mapping Over an Array {time="00:05:00"}

The new array returned from `map` will always have the same number of
elements as the source array.

~~~ {exec="../src/examples/irb-nil.sh"}
numbers = [1, 2, 3, 4]; nil
numbers.map {|n| n + 2}
~~~

### Mapping Over a Hash {time="00:05:00"}

When mapping over a hash, the block will be yielded two arguments, the
key and value for each entry.  Notice that `map` always returns an
array.  For hashes, the new array returned from `map` will have the
same number elements as the hash has entries.

~~~ {exec="../src/examples/irb-nil.sh"}
h = {"Jan" => 1, "Feb" => 2}; nil
h.map {|k, v| "#{k} is #{v}"}
~~~

### Lab: Figuring out Who Ate What

<div class="notes">

The `map` method can sometimes be difficult to understand.  Since
practice makes perfect, let's put `map` into action.

</div>

  #. Add a `people` method to the `CandyBar` class.

  #. It should return an array of strings, where each string contains
     the name of a person, a space, and then the percentage of the candy
     bar they ate.  (Hint: use `map`.)

  #. Add appropriate tests.

<div class="notes">

### Reference Implementation {time="00:03:00"}

  * From `candy_bar.rb`:

    ~~~ {.ruby insert="../src/examples/core_classes/candy_bar_test.rb" token="people"}
    ~~~

  * From `candy_bar_test.rb`:

    ~~~ {.ruby insert="../src/examples/core_classes/candy_bar_test.rb" token="people-test"}
    ~~~

### A Slightly Better Version {time="00:03:00"}

  * From `candy_bar.rb`:

    ~~~ {.ruby insert="../src/examples/core_classes/candy_bar_test.rb" token="people-better"}
    ~~~

  * From `candy_bar_test.rb`:

    ~~~ {.ruby insert="../src/examples/core_classes/candy_bar_test.rb" token="people-better-test"}
    ~~~

</div>

### Closer Look: The `select` Method {time="00:05:00"}

![](../diagrams/select.dot)

<div class="notes">

Noteworthy points:

  * The `select` method applies a predicate to the source array.

  * The output array may therefore have fewer elements than the source
    array.

  * The output array will only contain those elements for which the
    predicate block returned `true`.

</div>

### Filtering an Array {time="00:05:00"}

The `select` method can be used to filter an array.  It creates a new
array that contains only those elements for which the block returns
`true`.  Because of that, `select` may return an array that has fewer
elements than the source array.

~~~ {exec="../src/examples/irb-nil.sh"}
numbers = [1, 2, 3, 4]; nil
numbers.select {|n| n >= 3}
~~~

### Filtering a Hash {time="00:05:00"}

The `select` method can also be used to filter a hash.  The `Hash`
class provides its own implementation of `select`, overriding the one
from `Enumerable`.  This allows it to return a hash instead of an
array since the `select` method in `Enumerable` always returns an
array.

~~~ {exec="../src/examples/irb-nil.sh"}
h = {"Jan" => 1, "Feb" => 2}; nil
h.select {|k, v| v > 1}
~~~

### Lab: Who's Hogging Up the Candy Bar?

<div class="notes">

Let's practice using the `select` method by figuring out who took more
than their fair share of the candy bar.

</div>

  #. Add a `hogs` method to the `CandyBar` class.

  #. It should return an array of names.

  #. Calculate the average bite size, then return the names of those
     people who ate more than the average.

  #. Write an appropriate test.

<div class="notes">

### Reference Implementation {time="00:05:00"}

~~~ {.ruby insert="../src/examples/core_classes/candy_bar_test.rb" token="hogs"}
~~~

</div>

### Lab: Playing with `Enumerable`

<div class="notes">

Let's spend a few minutes playing with the remaining methods in the
`Enumerable` module.

</div>

  #. Open the [documentation] [enumerable] for the `Enumerable`
     module.

  #. Work through the methods and experiment with them in `irb`

### Control Flow in Blocks {time="00:05:00"}

Things to remember when using blocks created with `do...end`:

  * If you use `return` it will exit the enclosing method, not the
    block

  * When using a block to iterate, you can use `next` and `break` to
    control the iteration

Structuring Nontrivial Ruby Applications
----------------------------------------

<div class="notes">

Up to this point the we've been working with small snippets of code
and occasionally with multiple files.  It's time to introduce the way
a typical Ruby project is structured.

### Learning Objectives {time="00:00:00"}

  * Directory and file structure of nontrivial projects.

  * Introduction to RubyGems and Bundler

</div>

### Typical Application Layout {time="00:05:00"}

![](../diagrams/layout.dot)

### Introduction to RubyGems {time="00:03:00"}

  * Repository of open source libraries and tools for Ruby

  * Package manager for Ruby libraries

  * "There's a gem for that!"

### Introduction to the Bundler RubyGem {time="00:03:00"}

  * Adds an additional layer to RubyGems

  * Manages your entire graph of dependencies

  * Ensures development and production environments match

  * Just makes things easier

### Lab: Installing the Bundler RubyGem

<div class="notes">

Let's take this opportunity to work with the `gem` tool and discover
which RubyGems are already installed on our systems.  If the Bundler
gem isn't installed then we'll install it.

</div>

  * Check to see if the Bundler gem is installed:

        gem list

  * If it's not installed:

        gem install bundler

### Lab: Creating a Skeleton Ruby Project

<div class="notes">

Using the `bundler` tool, students will create a skeleton project that
will be used for the rest of the day.

</div>

  #. Use the `bundler` tool to create a skeleton project:

        bundle gem discography -bt

  #. Open the `discography.gemspec` file and update strings that start
     with TODO.

  #. Install all dependencies:

        bundle install

  #. Explore the directory structure and generated files.  (Some of
     the generated files will be explained in the next lesson.)

### Using Modules to Create Namespaces {time="00:05:00"}

  * Creating a module:

    ~~~ {.ruby insert="../src/examples/core_classes/namespace_test.rb" token="module"}
    ~~~

  * Instantiating a class from a module:

    ~~~ {.ruby insert="../src/examples/core_classes/namespace_test.rb" token="weather"}
    ~~~

<div class="notes">

Noteworthy points:

  * Class and module names are constants.

  * Mention the difference between finding constants through the
    current lexical scope and through inheritance.

  * Nesting can be arbitrarily deep.

  * Nesting one class inside another has the same effect.

</div>

### Lab: Adding Classes to the Discography Application

<div class="notes">

It's time to write more complicated code that spans several files.
We'll also write tests for these new files.

</div>

  #. Place all files in `lib/discography` and all code in the
     `Discography` module.

  #. Write an `Album` class (in `album.rb`).  It should have:

     #. Attribute accessors for album name and year of release.

     #. An `initialize` method that takes these two items.

  #. Write an `Artist` class (in `artist.rb`).  It should have:

     #. An attribute accessor for the artist's name.

     #. An `initialize` method that takes an artist name and an array
        of albums.

     #. An `albums` method, that when given a year, returns an array
        of albums released that year. (Hint: `Array#select`.)

<div class="notes">

### Reference Implementation (`Album`) {time="00:03:00"}

~~~ {.ruby insert="../src/examples/structuring/discography_spec.rb" token="album"}
~~~

### Reference Implementation (`Artist`) {time="00:03:00"}

~~~ {.ruby insert="../src/examples/structuring/discography_spec.rb" token="artist"}
~~~

</div>

Testing with RSpec
------------------

<div class="notes">

So far, all of our testing has been done with the MiniTest library and
assertions.  It's time to experiment with [RSpec] [] and expectations.

### Learning Objectives {time="00:00:00"}

  * Introduction to the [RSpec] [] testing framework

  * Using expectations instead of assertions

  * Write a test for the `Artist` class

</div>

### Introduction to RSpec {time="00:03:00"}

[RSpec][] is an alternative testing framework for Ruby.  It sets
itself apart from MiniTest by:

  * Providing a DSL for performing specification testing in Ruby

  * Automatically generating human-readable failure messages

  * Allowing you to have more granular scoping shared objects

And:

  * Some people think it's prettier

### Expectations vs. Assertions {time="00:05:00"}

At the heart of the RSpec DSL are expectations:

~~~ {.ruby}
expect(something).to eq(1)
expect(something).to be > 5
expect(something).to be true
~~~

<div class="notes">

Noteworthy points:

  * A full list of RSpec expectations can be found here:

    <http://rubydoc.info/gems/rspec-expectations/>

</div>

### Lab: Testing Artists with RSpec

<div class="notes">

Let's use the [RSpec] [] testing framework to write tests for the
`Artist` class.

</div>

  #. Create a spec for the `Artist` class, in the `spec` directory,
     named `artist_spec.rb`

  #. Assign an array of albums to a constant for testing.

  #. Test that the `Artist#albums` method works correctly.

  #. Use the `spec/discography_spec.rb` file as a reference.

  #. Refer to the RSpec expectation docs for help:

    <http://rubydoc.info/gems/rspec-expectations/>

<div class="notes">

Noteworthy points:

  * Use Wikipedia as a source for creating an array of albums in your
    discography test file.  Assign this array to a constant for each
    access.

### Reference Implementation (Constant) {time="00:02:00"}

~~~ {.ruby insert="../src/examples/structuring/discography_spec.rb" token="constant"}
~~~

### Reference Implementation (Test) {time="00:03:00"}

~~~ {.ruby insert="../src/examples/structuring/discography_spec.rb" token="spec"}
~~~

</div>

Loading Data From YAML Files
----------------------------

<div class="notes">

In any nontrivial Ruby application you'll be working with data
generated outside of your project.  We're going to work with artist
and album information stored in YAML files as we further explore Ruby.

### Learning Objectives {time="00:00:00"}

  * Introduction to the YAML file format

  * Load a list of artists and albums using the YAML library

  * Introduction to class methods

  * Practical use of the `map` method

</div>

### Introduction to the YAML File Format  {time="00:05:00"}

  * An alternative to XML (and JSON)

  * Whitespace significant (watch out!)

  * Use spaces, not tabs

  * Make sure everything lines up

### Lab: Discography Information in a File

<div class="notes">

Let's create a YAML file containing discography data so it can be used
in a later lab.

</div>

Create a YAML file for your discography application called
`artists.yml` with the following formatting:

~~~ {.yaml insert="../src/examples/data/artists.yml"}
~~~

### Lab: Playing with IRB and YAML

<div class="notes">

Using `irb`, students can load their YAML files and see the shape of
the resulting data.

</div>

Start `irb` and play with your YAML data:

  #. Load the YAML library:

    ~~~ {exec="../src/examples/irb-nil.sh"}
    require("yaml"); nil
    ~~~

  #. Use the `YAML::load_file` method (using your own file):

    ~~~ {exec="../src/examples/irb-nil.sh|tail -n +5|sed 's/,/,\n /g'|sed 's/file_name/\"file.yml\"/'"}
    require("yaml")
    file_name = "../src/examples/data/artists.yml"
    data = YAML.load_file(file_name); nil
    data.first["albums"].first
    ~~~

### Lab: Create a `Library` Class

<div class="notes">

Now that we feel comfortable with the shape of data that YAML returns
to us, let's create a new class in our discography application.  This
is in preparation for the next lab where we'll actually load YAML data
from the file system.

</div>

  #. Create a new file in `lib/discography` named `library.rb`.

  #. Write a class named `Library` in the `Discography` namespace.

  #. The `initialize` method should accept an array of artists and
     store them in an instance variable.

  #. Use one of the `attr_` helper methods to create a getter for the
     list of artists.

### Brief Introduction to Class Methods {time="00:05:00"}

~~~ {.ruby insert="../src/examples/callbacks/class_meth_test.rb" token="battery"}
~~~

### Lab: Update the `Library` Class to Load Files

<div class="notes">

Now it's time to write a class method that takes a file name, open
that file, and load artists using the YAML library.

</div>

  #. Add a class method to the `Library` class named `open`.

  #. It should have one argument, the name of a YAML file.

  #. Load the file, convert the data structure returned from YAML into
     an array of `Artist` objects.

  #. Pass the array of `Artist` objects to the `new` method.

  #. Play with your code in `irb`.

<div class="notes">

### Reference Implementation {time="00:05:00"}

~~~ {.ruby insert="../src/examples/structuring/discography_test.rb" token="library-open"}
~~~

</div>

### Lab: Refactoring Artist and Album Conversion

<div class="notes">

The previous lab required a lot of patience as we worked our way
through a deeply nested data structure.  Let's remedy that by adding a
few more class helper methods.

</div>

  #. In the `Album` class, write a **class method** named `from_hash`
     that accepts a hash with two keys ("`name`" and "`year`") and
     creates (and returns) a new `Album` object.

  #. In the `Artist` class, write a **class method** named `from_hash`
     that accepts a hash with two keys ("`name`" and "`albums`").  The
     "`albums`" key will be an array of hashes.  Use the
     `Album::from_hash` method to convert it into an array of albums.
     Then create (and return) a new `Artist` object.

  #. Update the `Library::open` method to use `Artist::from_hash`
     instead of dealing with the raw hashes directly.

<div class="notes">

### Reference Implementation {time="00:05:00"}

  * The `Album::from_hash` method:

    ~~~ {.ruby insert="../src/examples/structuring/discography_test.rb" token="album-from-hash"}
    ~~~

  * The `Artist::from_hash` method:

    ~~~ {.ruby insert="../src/examples/structuring/discography_test.rb" token="artist-from-hash"}
    ~~~

  * The `Library::open` method:

    ~~~ {.ruby insert="../src/examples/structuring/discography_test.rb" token="library-open2"}
    ~~~

</div>

Regular Expressions in Ruby
---------------------------

<div class="notes">

Most scripting languages have built-in support for text matching using
regular expressions.  In Ruby, it's one of the primary ways we break
apart text and extract content we're interested in.  This lesson will
make sure that we're ready to use regular expressions in the real
world.

### Learning Objectives {time="00:00:00"}

  * Basic overview of regular expression syntax and usage

  * Regular expression syntax literals

  * Matching text using regular expressions

  * Text substitution using regular expressions

</div>

### Introduction to Regular Expressions {time="00:05:00"}

  * Matching SSNs:

    ~~~ {.ruby}
    /^\d{3}-?\d{2}-?\d{4}$/
    ~~~

  * Room Numbers:

    ~~~ {.ruby}
    /^Room\s+\w+$/
    ~~~

  * Blank Line:

    ~~~ {.ruby}
    /^\s*$/
    ~~~

### Regular Expression Primer {time="00:05:00"}

| Token    | Meaning                             |
|----------+-------------------------------------|
| `.`      | Match any single character          |
| `\w`     | Match a word character              |
| `\s`     | Match a space character             |

| Repeater | Meaning                             |
|----------+-------------------------------------|
| `?`      | Match zero or one preceding token   |
| `*`      | Match zero or more preceding tokens |
| `+`      | Match one or more preceding tokens  |

### Regular Expression Examples {time="00:05:00"}

Ruby's regular expression literals:

~~~ {exec="../src/examples/irb-nil.sh"}
r = /^\w+$/; nil
r.class

"Hello".match(r)
~~~

<div class="notes">

Noteworthy points:

  * Ruby has a dedicated syntax literal for regular expressions.

  * This means you don't have to write regular expressions into string
    literals and escape all the special characters.

</div>


### Lab: Exploring the `Regexp` Class

<div class="notes">

Let's take some time with `irb` and `ri` to familiarize ourselves with
regular expressions in Ruby.

</div>

Open `irb` and follow along.  Feel free to review the documentation
for the following classes/methods and experiment with them in `irb`:

  * `MatchData`

  * `String#match`

  * `String#gsub`

  * `String#gsub!`

### Using the `MatchData` Class {time="00:05:00"}

Extracting capture groups from a `MatchData`:

~~~ {exec="../src/examples/irb.sh"}
match = "Hello Ruby!".match(/^\w+\s+(\w+)/)

match[1]

match.post_match
~~~

### Lab: Experimenting with Regular Expressions

<div class="notes">

Let's put our knowledge of regular expressions to test by writing
expressions to match groups of interesting text.

</div>

For each of the following, construct a single regular expression that
matches all examples.  Test your regexp in `irb` or write a test.

  #. Extract the final number from each of the following:

     * Portal 15
     * NCC-1701
     * TXH 1138
     * 1 over 3
     * 16 has a 6

  #. Extract the name of each street:

     * 5678 Hoff St.
     * 1313 Mockingbird Ln.
     * 17B Tape Dr.

### Lab: Sorting Artists Properly

<div class="notes">

Now that we have more experience with regular expressions, let's
introduce them into our discography application by sorting artists by
first removing stop words.

</div>

Artist names often contain so-called stop words that should not be
considered when sorting.  These include "the", "a", and "an".

  #. Write a new instance method in the `Artist` class called
     `sort_name`.

  #. This method should return the name of the artist with initial
     stop words removed.

  #. Play with the `Library` class in `irb` along with the
     `Enumerable#sort_by` method.

<div class="notes">

### Reference Implementation {time="00:05:00"}

  * The `Artist#sort_name` method:

    ~~~ {.ruby insert="../src/examples/structuring/discography_test.rb" token="artist-sort-name"}
    ~~~

</div>

Intermediate Ruby
=================

> An expert is a person who has made all the mistakes that can be made
> in a very narrow field. -- Niels Bohr

I/O and Control Flow
--------------------

<div class="notes">

Up until this point, the only way to interact with our programs was by
running unit tests.  Now we're ready to write an interactive script
that works much like `irb` and takes requests directly from someone
working at a terminal.

### Learning Objectives {time="00:00:00"}

  * Basic I/O operations in Ruby

  * Cleaning up text after reading a whole line

  * Replacing multiple `if` expressions with `case`

  * Use the discography library from an external script

</div>

### Lab: Write an Interactive Discography Script

<div class="notes">

It's time to take a look at that `exe` directory created by Bundler.
Let's work though some of the basic I/O operations that Ruby supports.

</div>

  #. Open the `discography` file in the `exe` directory.

  #. Create a class named `UI` with one method: `run`.

  #. The `run` method should print `"Hello"` to the terminal.

    Hint:

    ~~~ {.ruby}
    $stdout.puts(message)
    ~~~

  #. At the bottom of the file create an instance of the `UI` class
     and send it the `run` message.

  #. Run your script:

        ruby -Ilib exe/discography

### Performing I/O in Ruby {time="00:05:00"}

`IO` objects in Ruby have all the methods you'd expect them to:

  * Writing a string and add a newline character:

    ~~~ {.ruby}
    handle.puts(message)
    ~~~

  * Write a string *without* adding a newline character:

    ~~~ {.ruby}
    handle.print(message)
    ~~~

  * Read a newline-terminated line:

    ~~~ {.ruby}
    input = handle.gets
    ~~~

  * Ruby starts with three open `IO` objects: `$stdin`, `$stdout`,
    `$stderr`

### Lab: Reading User Input

<div class="notes">

With the basic structure in place for an interactive script, let's use
a bit more of Ruby's I/O operations to interact with the terminal
user.

</div>

  #. Change the `run` method in the `UI` class to print a prompt
     followed by reading a line of input.

  #. Print a message back to the terminal showing a user what they
     typed.

  #. If the input string contains the word "`exit`" then call the
     `exit` method to terminate the script.

  #. At the bottom of the script, change the way you create an
     instance of the `UI` class to look something like this:

    ~~~ {.ruby}
    interface = UI.new
    loop {interface.run}
    ~~~

  #. Run your script:

        ruby -Ilib exe/discography

### Removing that Pesky Newline Character {time="00:03:00"}

  * The `String#chomp` method can be used to remove a trailing newline
    from a string.  It returns a new string with the newline removed.

    ~~~ {exec="../src/examples/irb-nil.sh"}
    input = "exit\n";nil
    input.chomp
    input
    ~~~

  * The `String#chomp!` method mutates the receiver.

    ~~~ {exec="../src/examples/irb-nil.sh"}
    input = "exit\n";nil
    input.chomp!
    input
    ~~~

### Lab: Reading a Library and Listing Artists

<div class="notes">

With a fully interactive script, albeit a bit simple, we have what we
need to bring in the discography library and read YAML files with the
`Library` class.

</div>

  #. Add an `initialize` method to the `UI` class.

  #. Use the `Library::open` method to create `@library`.  Assume that
     `ARGV[0]` contains the name of a YAML file.

  #. Add a new "list" command that sorts the artists in the library by
     their name and then prints out their names.

  #. Run your script as follows:

        ruby -Ilib exe/discography <yaml-file-name>

### Lab: Listing Albums for a Specific Artist

<div class="notes">

Our interactive script can produce a list of artists on demand.  Now
it's time to produce basic information about a specific artist such as
an artist name and a list of albums.

</div>

  #. Change the "list" command so that it proceeds each artist's name
     with a unique index number. (Hint: use
     `Enumerable#each_with_index`.)

  #. Add a new "artist" command that takes a number and prints out
     details about the artist with that index number.  Details should
     include the artist's name and a list of albums (sorted by year).

  #. Extra Credit: start the list index number at 1 instead of 0.

### Introducing the `case` Expression {time="00:03:00"}

~~~ {.ruby insert="../src/examples/control/case_test.rb" token="case-input"}
~~~

### Lab: Replacing `if` with `case`

<div class="notes">

As we've been writing our interactive script we have built up a long
chain of `if` expressions.  Now it's time to put the `case` expression
into use and clean things up a bit.

</div>

  #. Convert the long chain of `if` expressions you are currently
     using to dispatch user input into a `case` expression.

  #. Experiment with your script and make sure it's still working.

Code Sharing with Modules
-------------------------

<div class="notes">

Ruby restricts us to using single inheritance.  That is, when defining
a class it can only have a single superclass.  One common way to get
around this limitation is to share code using modules.  In this lesson
we'll add a feature to the `Album` class that already exists in the
`Artist` class.  Along the way we'll avoid duplicate implementations
by using modules.

### Learning Objectives {time="00:00:00"}

  * Introduction to how modules can be used to share code

  * Understand the difference between interfaces from other languages
    and modules in Ruby

  * Learn how to include module code into a class

</div>

### Lab: Share Sorting Code with Albums

<div class="notes">

Let's create a module to hold the sorting functionality we wrote for
the `Artist` class.  Then we can include the same functionality into
the `Album` class.

</div>

  #. Create a `sorting.rb` file in `lib/discography`.

  #. Create a module named `Discography::Sorting`.

  #. Move the `sort_name` method from `Artist` to `Sorting`.

  #. Include the `Sorting` module into `Artist` and `Album`.  Make
     sure those classes `require` the `discography/sorting` file.

  #. Make sure tests pass, play with the interactive script.

### Lab: Updating the Interactive Script

<div class="notes">

Now that artist and albums can be sorted by their name, let's add a
new feature to the interactive script.  This feature will allow users
to specify their desired sorting order for albums.

</div>

  #. Add a new command to the interactive script called "`sort`".

  #. The sort command must be followed by a space and then either
     "`year`" or "`name`".

  #. Record the sorting method in an instance variable.  It should
     start out as "`year`".

  #. When listing albums, obey the requested sorting order.

### A Few Notes About Modules {time="00:05:00"}

  * Modules are *almost* interfaces but not quite because they also
    contain implementations.

  * It's better to think of modules as introducing code through
    inheritance.

Method Dispatching and the Inheritance Hierarchy
------------------------------------------------

<div class="notes">

With the revelation that classes can only have one superclass, but can
reuse code by including modules, you might be wondering how Ruby
dispatches method calls.  In this lesson we're going to explore how
including a module silently alters the inheritance hierarchy.

### Learning Objectives {time="00:00:00"}

  * Explore simple method dispatching when modules are not in use

  * Understand how including modules affects the inheritance hierarchy

  * Experiment with some of Ruby's introspection features

</div>

### The Inheritance Hierarchy (Part 1) {time="00:03:00"}

![](../diagrams/artist-wo-module.dot)

### The Inheritance Hierarchy (Part 2) {time="00:03:00"}

![](../diagrams/artist-w-module.dot)


### Seeing for Yourself {time="00:10:00"}

  #. Open `irb` in your `discography` project:

    ~~~
    irb -wIlib -rdiscography
    ~~~

  #. Ask the `Artist` class who its superclass is:

    ~~~ {.ruby}
    Artist.superclass
    ~~~

  #. Now ask the `Artist` class for its *ancestors*:

    ~~~ {.ruby}
    Artist.ancestors
    ~~~

### The `method_missing` Method {time="00:05:00"}

What happens when you call a method that doesn't exist?

  * If a method named `method_missing` exists in the inheritance
    hierarchy it is called.

  * Otherwise and exception is raised.

Safety Tip: When you define a method named `method_missing` you are
probably doing something wrong.  In other words, don't use
`method_missing`.

Raising and Rescuing Exceptions
-------------------------------

<div class="notes">

Things don't always go as planned.  This lesson works though the
basics of raising and rescuing exceptions.

### Learning Objectives {time="00:00:00"}

  * Introduce basic exception handling.

  * Understand why raising strings is a bad idea.

  * Clarify exceptions vs. `catch` and `throw`.

</div>

### Lab: Playing with Exceptions in IRB

<div class="notes">

To get a feel for the basics of exceptions, let's raise a few in
`irb`.

</div>

Open `irb` and follow along.

<div class="notes">

#### Demonstrations and Exercises {time="00:05:00"}

  * Raising a `String`:

    ~~~ {exec="../src/examples/irb-nil.sh|head -2"}
    raise("FAIL!")
    ~~~

  * Which is a shortcut for:

    ~~~ {exec="../src/examples/irb-nil.sh|head -2"}
    raise(RuntimeError, "FAIL!")
    ~~~

  * They're just classes tough:

    ~~~ {exec="../src/examples/irb.sh"}
    e = RuntimeError.new("FAIL!")
    e.message
    ~~~

</div>

### The Exception Class Hierarchy (Incomplete) {time="00:03:00"}

![](../diagrams/exceptions.dot)

### Creating Your Own Exceptions {time="00:06:00"}

Creating the class:

~~~ {.ruby insert="../src/examples/exception_basics/custom_test.rb" token="class"}
~~~

Raising an exception with it:

~~~ {.ruby insert="../src/examples/exception_basics/custom_test.rb" token="raise"}
~~~

<div class="notes">

Noteworthy points:

  * Exception classes *must* inherit from the `Exception` class or one
    of its decedents.  It can't be raised as an exception otherwise.

  * Exception classes should typically inherit from `StandardError`.

  * The names of exception classes should end with "`Error`".

  * Custom exception classes are just like another other class:

    - They can have attributes (accessors) for more details.
    - They can have their own `initialize` method (remember to call
      `super` with an error message).
    - And they can do anything else you'd like them to.

</div>

### Lab: Raising Exceptions in the Interactive Script

<div class="notes">

Our interactive discography script doesn't currently behave very well
if you forget to give it a library file.  Let's change that in two
phases.  First we'll raise an exception.  In the next lab we'll rescue
that exception and print a useful error message.

</div>

  #. Open the `discography` file in the `exe` directory.

  #. Inside the `UI` class, create an exception class named
     `MissingFileError`.  (Hint: Derive from `StandardError`.)

  #. In the `UI#initialize` method, raise your new exception if a
     library file was not given (`ARGV` is empty).

  #. Play with the interactive script.  Omit the library file on the
     command line and see what happens.

  #. Extra credit: Use `File::exist?` to see if `ARGV[0]` is a real
     file name and raise an exception if necessary.

### Rescuing Exceptions {time="00:03:00"}

~~~ {.ruby insert="../src/examples/exception_basics/exception_test.rb" token="begin"}
~~~

### Writing Exception Safe Code {time="00:03:00"}

~~~ {.ruby insert="../src/examples/exception_basics/exception_test.rb" token="ensure"}
~~~

### All Parts Together {time="00:03:00"}

~~~ {.ruby insert="../src/examples/exception_basics/exception_test.rb" token="all"}
~~~

### Lab: Improving Error Messages in the Interactive Script

<div class="notes">

In the last lab we added a custom exception class that is raised when
the script user forgets to supply a valid discography YAML file.  Now
let's rescue that exception and produce a nice error message instead.

</div>

  #. At the bottom of the `discography` script, wrap the code that
     instantiates the `UI` class (and calls `run` from `loop`) inside
     a `begin` block.

  #. Rescue the `UI::MissingFileError` exception and print a more
     friendly error message.

  #. Use the `exit` method (passing it `1` as an argument) to exit the
     program and signal an error condition to the controlling
     terminal.

### Watch Out for the `try` and `catch` Keywords {time="00:03:00"}

  * Exceptions are thrown with `raise`, and caught with `rescue`.

  * Ruby *does* have `try` and `catch` keywords though.

  * They're for control flow, and not exceptions.

Interactive Debugging of Ruby Code
----------------------------------

<div class="notes">

Ruby is a very dynamic language and sometimes that can lead to
problems that are difficult to track down.  In this lesson we'll look
at some useful tips for finding such problems, including pulling at
the big guns, the debugger.

### Learning Objectives {time="00:00:00"}

  * Cover tips for tracking down problematic code

  * Discover which debugging RubyGem you should be using

  * Learn how to insert breakpoints outside the debugger

</div>

### General Debugging Tips {time="00:05:00"}

Sometimes the simple things work the best:

  * Print something to the terminal:

    ~~~ {.ruby}
    $stderr.puts("WTF?")
    ~~~

  * Raise an exception:

    ~~~ {.ruby}
    raise("Malfunction!")
    ~~~

### Which Debugging Gem Should You Use? {time="00:05:00"}

| Ruby Version | Implementation | RubyGem Name | Helper Method |
|--------------+----------------+--------------+---------------|
| == 1.9.3     | MRI            | debugger     | `debugger`    |
| >= 2.0       | MRI            | byebug       | `byebug`      |
| == 1.9.3     | JRuby          | ruby-debug   | `debugger`    |
| >= 2.0       | JRuby          | NONE         | NONE          |

MRI:
  ~ Official C Version

JRuby:
  ~ Unofficial Java Version

### Lab: Debugging the `Library` Class

<div class="notes">

Now that you know which RubyGem you should be using for debugging,
let's install it and force our script to drop into the debugger.

</div>

Follow along with the instructor.

<div class="notes">

#### Steps We'll Take in Class {time="00:20:00"}

  #. Add the appropriate debugging RubyGem to your gem-specification
     file and then `bundle install`.

  #. Open the file containing the `Library` class and insert the
     appropriate helper method from the debugging RubyGem.

  #. Start the interactive script and trigger the debugger.

</div>

Common Optimization Techniques
------------------------------

<div class="notes">

As we wrap up our tight focus on Ruby, students are show some
techniques which will help them avoid performance problems.

### Learning Objectives {time="00:00:00"}

  * Using the "`||=`" operator for memoization.

  * Avoiding object literals in loops.

  * Differences between compile time and run time.

  * Limit metaprogramming to compile time.

</div>

### Reminder: Everything in Ruby Happens at Run Time {time="00:03:00"}

Ruby is *very* dynamic.  But this comes with a price.

(JRuby supports compiling Ruby to Java bytecode.)

### The Distinction Between Compile Time and Run Time {time="00:03:00"}

  * Ruby does parse your program and issue compile-time warnings

  * It then immediately started to execute it

  * It's useful to separate these two phases in your head

  * Use the "`-w`" command line option to `ruby`/`jruby`

### Before You Start Optimizing Code... {time="00:03:00"}

Profile it!  (You knew that though.)

### Caching Expensive Computations: Problem {time="00:03:00"}

~~~ {.ruby insert="../src/examples/effrb/memoize_test.rb" token="shipped"}
~~~

### Expanding the "`||=`" Operator {time="00:03:00"}

This little expression:

~~~ {.ruby}
x ||= y
~~~

Expands to:

~~~ {.ruby}
x = x || y
~~~

### Caching Expensive Computations: Memoization {time="00:05:00"}

~~~ {.ruby insert="../src/examples/effrb/memoize_test.rb" token="shipped-memoize"}
~~~

<div class="notes">

Noteworthy points:

  * Memoization can be dangerous.

  * You need to consider how long a computation will be cached.

  * Also, are there any side effects being skipped due to caching?

  * Don't introduce bugs just to speed things up!

  * Do you even need to improve the performance?  Did you profile the code?

</div>

### Lab: Playing with the "`||=`" Operator

<div class="notes">

In order to cement the ideas of how the unusual "`||=`" operator
works, students are guided through an `irb` session.

</div>

Open `irb` and experiment with the "`||=`" operator.

### Another Common Problem in Ruby: Literals {time="00:03:00"}

~~~ {.ruby insert="../src/examples/effrb/literals_test.rb" token="inloop-fatal-2"}
~~~

### Avoid Literals in Loops {time="00:05:00"}

~~~ {.ruby insert="../src/examples/effrb/literals_test.rb" token="outloop-const"}
~~~

<div class="notes">

  * Each time you create an object you might trigger the garbage
    collector.

  * Put the literals in frozen constants.

  * Why frozen?  So they can't be mutated accidentally.

</div>

### Limit Metaprogramming to Compile Time {time="00:05:00"}

Try to limit your metaprogramming voodoo to:

  * When a file is loaded by the `require` method.

  * After a class is created or uses the `include` method via class
    and module hooks.

  * The time you'd generally consider to be "compile time".

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

<!-- Ruby Related Technologies -->
[mri]: http://www.ruby-lang.org
[ruby-doc]: http://ruby-doc.org
[ruby-book]: https://www.safaribooksonline.com/library/view/the-ruby-programming/9780596516178/
[jruby]: http://jruby.org/
[rubymotion]: http://www.rubymotion.com/
[minitest]: http://docs.seattlerb.org/minitest/
[rspec]: http://rspec.info/
[cucumber]: http://cukes.info/
[capybara]: https://github.com/jnicklas/capybara
[effective ruby]: http://www.effectiveruby.com/
[enumerable]: http://ruby-doc.org/core/Enumerable.html
[atom]: https://atom.io/
[gems]: http://rubygems.org/
[exercism.io]: http://exercism.io/
[ruby koans]: http://rubykoans.com/
[codementor]: https://www.codementor.io/
[mocha]: http://gofreerange.com/mocha/docs/

<!-- Rails Related Technologies -->
[rest]: http://en.wikipedia.org/wiki/Representational_State_Transfer
[jbuilder]: https://github.com/rails/jbuilder
[capistrano]: http://capistranorb.com/
[capistrano-rails]: https://github.com/capistrano/rails
[warbler]: https://github.com/jruby/warbler
[google chrome]: https://www.google.com/chrome/browser/
[rails way]: https://www.safaribooksonline.com/library/view/the-railstm-4/9780133487954/
[rails home]: http://rubyonrails.org/
[rails api]: http://api.rubyonrails.org/
[rails guides]: http://guides.rubyonrails.org/
[devise]: https://github.com/plataformatec/devise
[pundit]: https://github.com/elabs/pundit
[factory_girl]: https://github.com/thoughtbot/factory_girl
[rails installer]: http://railsinstaller.org/en
