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

![](../../diagrams/map.dot)

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

~~~ {exec="../../src/examples/irb-nil.sh"}
numbers = [1, 2, 3, 4]; nil
numbers.map {|n| n + 2}
~~~

### Mapping Over a Hash {time="00:05:00"}

When mapping over a hash, the block will be yielded two arguments, the
key and value for each entry.  Notice that `map` always returns an
array.  For hashes, the new array returned from `map` will have the
same number elements as the hash has entries.

~~~ {exec="../../src/examples/irb-nil.sh"}
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

    ~~~ {.ruby insert="../../src/examples/core_classes/candy_bar_test.rb" token="people"}
    ~~~

  * From `candy_bar_test.rb`:

    ~~~ {.ruby insert="../../src/examples/core_classes/candy_bar_test.rb" token="people-test"}
    ~~~

### A Slightly Better Version {time="00:03:00"}

  * From `candy_bar.rb`:

    ~~~ {.ruby insert="../../src/examples/core_classes/candy_bar_test.rb" token="people-better"}
    ~~~

  * From `candy_bar_test.rb`:

    ~~~ {.ruby insert="../../src/examples/core_classes/candy_bar_test.rb" token="people-better-test"}
    ~~~

</div>

### Closer Look: The `select` Method {time="00:05:00"}

![](../../diagrams/select.dot)

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

~~~ {exec="../../src/examples/irb-nil.sh"}
numbers = [1, 2, 3, 4]; nil
numbers.select {|n| n >= 3}
~~~

### Filtering a Hash {time="00:05:00"}

The `select` method can also be used to filter a hash.  The `Hash`
class provides its own implementation of `select`, overriding the one
from `Enumerable`.  This allows it to return a hash instead of an
array since the `select` method in `Enumerable` always returns an
array.

~~~ {exec="../../src/examples/irb-nil.sh"}
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

~~~ {.ruby insert="../../src/examples/core_classes/candy_bar_test.rb" token="hogs"}
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

![](../../diagrams/layout.dot)

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

    ~~~ {.ruby insert="../../src/examples/core_classes/namespace_test.rb" token="module"}
    ~~~

  * Instantiating a class from a module:

    ~~~ {.ruby insert="../../src/examples/core_classes/namespace_test.rb" token="weather"}
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

~~~ {.ruby insert="../../src/examples/structuring/discography_spec.rb" token="album"}
~~~

### Reference Implementation (`Artist`) {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/structuring/discography_spec.rb" token="artist"}
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

  #. Use the `src/examples/structuring/discography_spec.rb` file as a reference.

  #. Refer to the RSpec expectation docs for help:

    <http://rubydoc.info/gems/rspec-expectations/>

<div class="notes">

Noteworthy points:

  * Use Wikipedia as a source for creating an array of albums in your
    discography test file.  Assign this array to a constant for each
    access.

### Reference Implementation (Constant) {time="00:02:00"}

~~~ {.ruby insert="../../src/examples/structuring/discography_spec.rb" token="constant"}
~~~

### Reference Implementation (Test) {time="00:03:00"}

~~~ {.ruby insert="../../src/examples/structuring/discography_spec.rb" token="spec"}
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

~~~ {.yaml insert="../../src/examples/data/artists.yml"}
~~~

### Lab: Playing with IRB and YAML

<div class="notes">

Using `irb`, students can load their YAML files and see the shape of
the resulting data.

</div>

Start `irb` and play with your YAML data:

  #. Load the YAML library:

    ~~~ {exec="../../src/examples/irb-nil.sh"}
    require("yaml"); nil
    ~~~

  #. Use the `YAML::load_file` method (using your own file):

    ~~~ {exec="../../src/examples/irb-nil.sh|tail -n +5|sed 's/,/,\n /g'|sed 's/file_name/\"file.yml\"/'"}
    require("yaml")
    file_name = "../../src/examples/data/artists.yml"
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

~~~ {.ruby insert="../../src/examples/callbacks/class_meth_test.rb" token="battery"}
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

~~~ {.ruby insert="../../src/examples/structuring/discography.rb" token="library-open"}
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

    ~~~ {.ruby insert="../../src/examples/structuring/discography_test.rb" token="album-from-hash"}
    ~~~

  * The `Artist::from_hash` method:

    ~~~ {.ruby insert="../../src/examples/structuring/discography_test.rb" token="artist-from-hash"}
    ~~~

  * The `Library::open` method:

    ~~~ {.ruby insert="../../src/examples/structuring/discography_test.rb" token="library-open2"}
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

~~~ {exec="../../src/examples/irb-nil.sh"}
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

~~~ {exec="../../src/examples/irb.sh"}
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

    ~~~ {.ruby insert="../../src/examples/structuring/discography_test.rb" token="artist-sort-name"}
    ~~~

</div>
