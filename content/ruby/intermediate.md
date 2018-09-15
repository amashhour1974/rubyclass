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

    ~~~ {exec="../../src/examples/irb-nil.sh"}
    input = "exit\n";nil
    input.chomp
    input
    ~~~

  * The `String#chomp!` method mutates the receiver.

    ~~~ {exec="../../src/examples/irb-nil.sh"}
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

~~~ {.ruby insert="../../src/examples/control/case_test.rb" token="case-input"}
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

![](../../diagrams/artist-wo-module.dot)

### The Inheritance Hierarchy (Part 2) {time="00:03:00"}

![](../../diagrams/artist-w-module.dot)


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

    ~~~ {exec="../../src/examples/irb-nil.sh|head -2"}
    raise("FAIL!")
    ~~~

  * Which is a shortcut for:

    ~~~ {exec="../../src/examples/irb-nil.sh|head -2"}
    raise(RuntimeError, "FAIL!")
    ~~~

  * They're just classes tough:

    ~~~ {exec="../../src/examples/irb.sh"}
    e = RuntimeError.new("FAIL!")
    e.message
    ~~~

</div>

### The Exception Class Hierarchy (Incomplete) {time="00:03:00"}

![](../../diagrams/exceptions.dot)

### Creating Your Own Exceptions {time="00:06:00"}

Creating the class:

~~~ {.ruby insert="../../src/examples/exception_basics/custom_test.rb" token="class"}
~~~

Raising an exception with it:

~~~ {.ruby insert="../../src/examples/exception_basics/custom_test.rb" token="raise"}
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

~~~ {.ruby insert="../../src/examples/exception_basics/exception_test.rb" token="begin"}
~~~

### Writing Exception Safe Code {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/exception_basics/exception_test.rb" token="ensure"}
~~~

### All Parts Together {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/exception_basics/exception_test.rb" token="all"}
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

~~~ {.ruby insert="../../src/examples/effrb/memoize_test.rb" token="shipped"}
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

~~~ {.ruby insert="../../src/examples/effrb/memoize_test.rb" token="shipped-memoize"}
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

~~~ {.ruby insert="../../src/examples/effrb/literals_test.rb" token="inloop-fatal-2"}
~~~

### Avoid Literals in Loops {time="00:05:00"}

~~~ {.ruby insert="../../src/examples/effrb/literals_test.rb" token="outloop-const"}
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
