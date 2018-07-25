# Overview and Objectives

An accelerated training course for experienced software developers who
want to learn Ruby on Rails.

## Training Details {time="00:00:00"}

Duration:
  ~ 3 days of 8-hour long training sessions.
Purpose:
  ~ Learn how to write web applications with Ruby on Rails.
Student Skill Level:
  ~ Prior experience with Ruby is required.

## Training Delivery

This training course is divided into three, eight-hour days.  Each day
focuses on a new major topic with appropriate review of previously
discussed topics.  Students will spend *at least* 50% of their time
working hands-on with Ruby on Rails to maximize exposure and
experience.

## Introduction to Ruby on Rails {time="00:00:00"}

Armed with a solid understanding of Ruby fundamentals, students will
begin to explore the world of Ruby on Rails.  After a brief overview
of the architecture of Ruby on Rails, students will dive right in by
building and testing a simple application.  Throughout the day
students will also spend time writing and testing Ruby code to further
solidify their Ruby knowledge.

  - Introduction to the World of Web Applications
  - Overview of the Ruby on Rails Architecture
  - Routing, URLs, CRUD, and Controllers
  - Template Rendering, Partials, and Layouts
  - The Rails Asset Pipeline
  - Model and Controller Life Cycle Callbacks
  - Database Schema Management through Migrations
  - Constructing SQL through Relational Algebra
  - Connecting Models Together with Associations
  - Back-end Model Validation

## Diving Deeper into Rails {time="00:00:00"}

Ruby on Rails is a large, complex web-application framework.  Students
will begin the day with a review of what they've learned so far.  They
will then quickly move into practical considerations when using Rails
to build a web application.  All web applications share several
important features.  Students will learn how to implement these using
Ruby on Rails and a handful of RubyGems.

  - Session Management, Authentication, and Authorization
  - Rails View Integration with jQuery
  - Building RESTful APIs with JSON and XML
  - Implementing Complex Logic using State Machines
  - Advanced Model Class Techniques (STI and Polymorphism)
  - Using Arel to Calculate Aggregations
  - Generating and Sending Email
  - Rails Configuration and Environments

## Practical Ruby on Rails {time="00:00:00"}

By this point students have been exposed to many of the features found
in Ruby on Rails for building advanced web applications.  This final
day of training will recap major topics learned so far and move even
further by exploring advanced architecture and maintenance issues.

  - Rails Features for User Interface Internationalization
  - Using Mocking, Stubbing, and Factories for Testing
  - Debugging Ruby on Rails Applications
  - Avoiding Common Security Pitfalls (SQL Injection, XSS, XSRF)
  - Customizing the Middleware Stack
  - Deploying Applications to Production
  - Scaling the Performance of Ruby on Rails
  - Using Engines to Share Major Application Features
  - Advanced Testing with [RSpec][], [Cucumber][], and [Capybara][]
  - Background Work Processing
  - Upgrading to the Latest Version of Ruby on Rails

# Introduction to Ruby on Rails

> Progress is possible only if we train ourselves to think about
> programs without thinking of them as pieces of executable code.
> -- Edsger W. Dijkstra

## Starting Out with Ruby on Rails

### Getting Ready for Rails {time="00:02:00"}

  * We'll cover a little background information

  * Then we're jumping right in and creating a Rails app

### The Tools We'll Be Using {time="00:02:00"}

  * Text editor (I recommend [Atom][]).

  * Web browser (I recommend [Google Chrome][]).

  * The command line

## Introduction to Web Applications

### The 50,000 Foot View {time="00:05:00"}

![](diagrams/ruby/rails/browser-server.pdf)

<div class="notes">

Noteworthy points:

  * This diagram shows a web browser on the left, but represents any
    HTTP client.

  * Communication between the browser and the server uses the
    Hypertext Transfer Protocol (HTTP).

  * HTTP is a request-response protocol.  The client makes a request
    and the server returns a response.  The client always
    initiates the request-response cycle.

</div>

### Making an HTTP Request {time=00:05:00}

  #. Enter "`http://www.google.com/`" into your browser.

  #. The browser looks up the IP address for `www.google.com`.

  #. Using the IP address, the browser connects to the server.

  #. A request is made to the server using HTTP:

    ~~~
    GET / HTTP/1.1
    Host: www.google.com
    Accept: */*
    ~~~

### The HTTP Request Line {time=00:05:00}

When requesting "`http://www.google.com/`":

![](diagrams/ruby/rails/http-req.pdf)

### HTTP Request Methods {time="00:05:00"}

Most common HTTP request methods:

`GET`:
  ~ Retrieve a resource from the server.
`HEAD`:
  ~ Retrieve information about a resource (headers only).
`POST`:
  ~ Send data to the server (usually form data).
`PATCH`:
  ~ Update a resource on the server.
`DELETE`:
  ~ Remove a resource from the server.

### The HTTP Response from the Server {time="00:05:00"}

  #. The server fetches or creates the requested resource.

  #. The resource is returned using HTTP:

    ~~~
    HTTP/1.1 200 OK
    Content-Type: text/html
    Content-Length: 1000

    <html>
    ...
    ~~~

### The HTTP Status Line {time="00:05:00"}

![](diagrams/ruby/rails/http-status-line.pdf)

<div class="notes">

Noteworthy points:

  * The server confirms the protocol version.

  * The status code is for the browser to parse.

  * The reason phrase is for a human user.

  * You've probably already seen status codes before.  For example,
    404 means "File not found."

</div>


### Request/Response Timeline {time="00:05:00"}

![](diagrams/ruby/rails/http-timeline.pdf)

<div class="notes">

Noteworthy points:

  * The client initiates the conversation with the initial request
    (line 1).

  * The server responds with an HTML document (line 2).

  * The client parses the HTML document and notices that an image is
    used.

  * The client requests the image from the server (line 3).

  * The server responds with the image (line 4).

</div>


### Client-side Technologies {time="00:05:00"}

The three major technologies in the browser are:

HTML:
  ~ Document content.
CSS:
  ~ How to present and style content.
JavaScript:
  ~ Behavior and user interaction.

### Example HTML Document {time="00:05:00"}

~~~ {.html insert="src/javascript/jsfund/examples/simple.html"}
~~~

### The Document Object Model (DOM) {time="00:10:00"}

<div class="notes">

The previous HTML document is parsed by the web browser and turned
into a tree-like structure called the DOM.

</div>

![](diagrams/javascript/javascript/dom.pdf)

<div class="notes">

Noteworthy points:

  * The DOM is a tree-like structure made up of *nodes*, also referred
    to as *elements*.

  * CSS and JavaScript use the DOM to style or manipulate individual
    nodes or groups of nodes.

  * JavaScript can be used to insert new nodes, remove nodes, or
    change existing nodes.

  * CSS uses *selectors* to target nodes so that their properties can
    be changed.  JavaScript---through libraries such as jQuery---can
    also use CSS selectors for targeting locations in the DOM.

</div>

### Server-side Technologies {time="00:05:00"}

  * Persistent data store (usually a relational database)

  * Code for business logic, authentication, etc.

  * Assets such as images, CSS, and JavaScript

  * Dynamic HTML generation

### Browsers and Web Applications {time="00:05:00"}

![](diagrams/ruby/rails/browser-webapp.pdf)

## A Little Bit of Rails History

### Where Rails Comes From {time="00:02:00"}

  * David Heinemeier Hansson (DHH) extracted Rails from a web
    application he wrote around 2004

### The Web Scene Circa 2004 {time="00:02:00"}

  * Dominated by PHP and haphazard CGI scripts

  * Java already doing MVC web development (Turbine and Spring)

### Rails Today {time="00:02:00"}

  * Rails 4.1 was released in April of 2014

  * The framework continues to grow rapidly

  * At the same time, older features are deprecated and eventually
    removed from the framework

## Overview of the Ruby on Rails Architecture

### What Exactly is Ruby on Rails? (Part 1) {time="00:03:00"}

A collection of related libraries for building web applications:

![](diagrams/ruby/rails/gems.pdf)

### What Exactly is Ruby on Rails? (Part 2) {time="00:02:00"}

Rails is also:

  * An opinionated code generator

  * A (forced) way to structure your web application

  * Overwhelmingly massive

  * ...but modular enough to pick and choose features

  * Stable and mature

### Design Goals {time="00:03:00"}

  * Convention over configuration

  * Don't repeat yourself (DRY)

  * Modular

  * Full-stack framework (MVC)

### Models in Rails {time="00:03:00"}

Models are:

  * The lowest level in a Rails application

  * Data structures that are persisted to a database

  * Connected to one another to express relationships

  * The central location for data validation

  * Good location for simple business logic

### Views in Rails {time="00:03:00"}

Views:

  * UI representation of a model, such as HTML or JSON

  * May contain a limited amount of UI logic

  * Should not contain business logic

  * Have limited access to models

### Controllers in Rails {time="00:03:00"}

Controllers:

  * Handle incoming HTTP requests

  * Create, read, update, delete records (via models)

  * Act as a bridge between models and views

  * Respond to HTTP requests with a view

### Environments {time="00:03:00"}

  * Separate configurations, databases, etc.

  * Default set: `development`, `test`, and `production`

  * The `development` mode is friendly to programmers

  * The `production` mode is tuned for performance

  * The `test` mode makes it safe to trample a database

## First Steps Towards Building a Rails Application

### Ensure that Ruby on Rails is Installed {time="00:02:00"}

  * **Windows Users** from a command prompt:

    ~~~
    gem install rails
    ~~~

  * **Mac/Unix Users** from a command prompt:

    ~~~
    sudo gem install rails
    ~~~

### Create a New Ruby on Rails Application Skeleton {time="00:05:00"}

We're going to create a Rails application to track discographies.
We'll call the application "discography".

  #. Pick a folder where you want to store your Rails application.

  #. Open a terminal and `cd` into that folder.

  #. Use the `rails` tool to generate an application skeleton:

    ~~~
    rails new discography
    ~~~

    This will generate several files and install any missing RubyGem
    dependencies.

  #. You should now have a new "discography" folder.  Use `cd` to move
     into that folder.

### Let's Review the Folder Layout {time="00:05:00"}

~~~
|-- app
|   |-- assets
|   |-- controllers
|   |-- helpers
|   |-- mailers
|   |-- models
|   |-- views
|-- bin
|-- config
|-- db
|-- lib
|-- log
|-- public
|-- test
|-- vendor
~~~

<div class="notes">

Noteworthy points:

  * The `app` folder is the root for the MVC application

  * Don't let your MVC layers get too big

  * Instead, build a class library in the `lib` folder

</div>

### Creating Our First Model {time="00:05:00"}

**NOTE**: For the rest of the course we'll be working with the command
line from within the folder that the `rails` tool created.  When
running any command please make sure you're in the "discography"
folder.

  * Use the `rails` code generator:

    ~~~
    rails generate model artist
    ~~~

  * Or the abbreviated form:

    ~~~
    rails g model artist
    ~~~

<div class="notes">

Noteworthy points:

  * Take a moment and look at some of the generated files

    - `app/models/artist.rb`
    - `test/models/artist_test.rb`
    - `db/migrate/NNNNNNNNNNNNNN_create_artists.rb`

  * Make sure you don't move files around.  Rails requires that these
    files be place into the folders where they were generated.

</div>

### Edit the Database Migration File {time="00:10:00"}

  #. Open the following file in your editor:

        db/migrate/NNNNNNNNNNNNNN_create_artists.rb

  #. Add a new database column:

    ~~~ {.ruby}
    create_table(:artists) do |t|
      t.string(:name, null: false)
      t.timestamps(null: false)
    end
    ~~~

<div class="notes">

Noteworthy points:

  * Although it's not the default in Rails, it's good to get into the
    habit of creating column constraints such as the `null: false`
    option from above.

</div>


### Apply the Migration to the Database {time="00:08:00"}

  #. From the command line, run the database migrations:

    ~~~
    rake db:migrate
    ~~~

  #. Then open the generated schema files in your editor:

    ~~~
    db/schema.rb
    ~~~

### Playing in the Console {time="00:10:00"}

  #. From the command line, start the Rails console:

    ~~~
    rails console
    ~~~

    *or*:

    ~~~
    rails c
    ~~~

  #. Create a new artist:

    ~~~ {.ruby}
    a = Artist.new(name: "The Knife")
    a.name
    a.id
    a.save
    a.id
    ~~~

  #. Exit the Rails console.

## Creating Our First User Interface

### Controllers and Views {time="00:03:00"}

  * Controllers go in `app/controllers`

  * Views go in `app/views/`*\<controller\>*

  * Controllers are classes

  * Their methods are referred to as *actions*

  * Usually, each controller action is mapped to a URL

  * And each controller action has its own view

  * CRUD controllers all have the same set of actions

### A Word About the Rails Inflection System {time="00:03:00"}

Rails is very opinionated about a noun's number:

  * Models are singular (e.g., "`Artist`")

  * Tables are plural (e.g., "`artists`")

  * Controllers are plural (e.g., "`ArtistsController`")

  * Views match the controller (e.g., "`app/views/artists`")

  * Single resources usually have singular controller names
    (e.g., "PreferenceController")

<div class="notes">

You can see the database schema by starting the `sqlite3` utility and
entering the following commands:

~~~
sqlite> .tables
sqlite> .schema artists
~~~

<!--
  Or use:

  M-x sql-sqlite
-->

You can also customize how words are pluralized by editing the
`config/initializers/inflections.rb` file.

</div>

### Generating the Scaffold Controller {time="00:05:00"}

A scaffold controller is a controller that is already completely
filled out and comes with automatically generated views.

  #. From the command line, generate a scaffold controller:

    ~~~
    rails g scaffold_controller Artist name:string
    ~~~

*Note:* scaffold controllers are created using the model name.

### Connecting the Controller to a URL {time="00:10:00"}

Controllers are connected to URLs through a routing table.

  #. Open the following file in your text editor:

        config/routes.rb

  #. Add the following lines inside the block:

    ~~~ {.ruby}
    root("artists#index") # Default route.
    resources(:artists)   # CRUD routes for artists.
    ~~~

  #. Save the file and switch to your terminal.

  #. From the command line, dump the routing table:

    ~~~
    rake routes
    ~~~

<div class="notes">

Noteworthy points:

  * Usually, routing resources are plural (e.g., "`/artists/*`")

  * We'll see the prefix later when we look at views and URL
    generators

  * The HTTP verb is part of representational state transfer (REST)

</div>

### Reviewing the Generated Controller Files {time="00:10:00"}

Take a look at the following controller files:

  * `app/controllers/artists_controller.rb`
  * `test/controllers/artists_controller_test.rb`

(We'll look at view files shortly.)

### Start the Rails Application {time="00:05:00"}

In order to interact with your Rails application you need to be
running the *Rails server*.

  #. From the command line, start the Rails server:

    ~~~
    rails server
    ~~~

  #. Open a web browser and navigate to the following URL:

     <http://localhost:3000>

  #. Take a few minutes and play with the application.  You should be
     able to create new artist, as well as edit and delete existing
     artists.

  #. When you are done, kill the Rails server with `Control-C`.

### What's Going On In Our App? (Index) {time="00:05:00"}

![](diagrams/ruby/rails/routing-timeline.pdf)

<div class="notes">

  #. The browser does an HTTP GET to `/artists`.

  #. The router figures out that it needs to use the
     `ArtistsController` and therefore creates one.

  #. Based on the HTTP method and URL path, the router decides to call
     the `index` method on the controller object.

  #. The controller pulls a list of all artists from the database and
     stores them in an instance variable.

  #. The controller then implicitly renders the view.

  #. The view renders the `index.html.erb` template.

  #. The controller then returns the generated HTML to the browser.

</div>


### What's Going On In Our App? (Create) {time="00:05:00"}

![](diagrams/ruby/rails/routing-timeline-create.pdf)

<div class="notes">

  #. The browser sends form data to the Rails application using an
     HTTP POST to `/artists`.

  #. The router creates a new instance of the `ArtistsController` and
     calls the `create` method on it.

  #. The controller creates a new `Artist` object.

  #. After setting the attributes on the new `Artist` object the
     controller saves it to the database.

  #. The controller then redirects the browser to the `/artists/1`
     path where `1` is the database ID for the new artist record.

  #. The browser follows the redirect request by sending a new HTTP
     request to the Rails application.

  #. Once again the router creates an instance of the
     `ArtistsController` and then calls the `show` method on it.

  #. The controller's `show` method fetches the requested `Artist`
     object from the database using the `find` method.

  #. The controller implicitly requests that view be rendered.

  #. The view renders the `show.html.erb` template.

  #. The controller returns the generated HTML to the browser.

</div>

### Reviewing the Generated View Files {time="00:20:00"}

Open and review the following view files:

  * `app/views/artists/index.html.erb`
  * `app/views/artists/show.html.erb`
  * `app/views/artists/new.html.erb`
  * `app/views/artists/edit.html.erb`
  * `app/views/artists/_form.html.erb`

<div class="notes">

Noteworthy points:

  * The file names indicate that these are HTML files which are
    generated by the ERB template language

  * ERB allows you to inject a bit of Ruby into plain text files

  * Ruby code is inserted between "`<%`" and "` %>`"

  * Ruby code that should insert HTML into the template is executed by
    inserting code between "`<%=`" and "`%>`"

  * Instance variables defined in the controller are available in the
    view

  * In the views you can see the `link_to` helper along with the
    automatically generated URL helper methods such as
    `new_artist_path`.  These come via the routing file.

  * HTML injected into the template by Ruby code is automatically
    sanitized to prevent XSS attacks

  * View files whose names begin with an underscore are called
    *partials* (e.g., "`_form.html.erb`")

  * Partials can be rendered into the existing template with the
    `render` method (for an example see the `new.html.erb` file)

  * Rails comes with *a lot* of HTML helper methods such as
    `form_for`.  It's helpful to open your browser to a page and view
    the source to see the HTML these helpers are generating.

  * The documentation for each of these helper methods can be found
    here: <http://api.rubyonrails.org/>

</div>

### Reviewing the Raw HTML Produced by the Templates {time="00:10:00"}

Let's review the HTML that those views are generating.

  #. From the command line, start the Rails server.

  #. In a web browser, navigate to the artist controller.

  #. For each controller action, compare the template file with the
     browser's "View Source" option.

  #. When you are done, kill the Rails server with `Control-C`.

### The Default Application Layout File {time="00:05:00"}

All of the views are being wrapped in a *layout*.  Let's look at the
default layout.

  #. In your text editor, open and review the following file:

        app/views/layouts/application.html.erb

     This is the default layout file.  Unless otherwise specified, all
     non-partial views are rendered into this file (in place of the
     `yield` expression).

### A Word About TurboLinks {time="00:05:00"}

Notice this line in the application layout:

~~~ {.ruby}
<%= javascript_include_tag 'application',
        'data-turbolinks-track' => true %>
~~~

<div class="notes">

This line enables "TurboLinks".  What is TurboLinks?  It improves UI
performance by:

  * Hijacking all links in the HTML, turning them into Ajax links

  * For Ajax requests, Rails automatically skips rending the layout

  * TurboLinks replaces the `body` of the HTML with the Rails response

Depending on your UI, you may not want this.

</div>

### Avoiding Duplication {time="00:10:00"}

For the controller and view level, Rails offers many ways to avoid
code duplication.

<div class="notes">

Consider the following:

  * Helper methods that are available in the view, such as `form_for`.

  * View partials give you the ability to extract common HTML snippets
    and render them from any view.

  * Each controller has a helper module in `app/helpers` and a global
    helper module in `app/helpers/application_helper.rb`.  Methods
    defined in these modules are available in your view.  Generally,
    you'll want to use these as little as possible.

  * The `app/controllers/concerns` directory is a place to store
    modules that you can mix into your controllers.  If your
    controllers start to contain duplication, DRY them up by
    extracting the common code into modules.

  * You can export controller methods so that they can be used from
    within a view by using the `helper_method` controller method.
    However, this is rarely a good idea.

</div>

## Associating Models With One Another

<div class="notes">

### Adding Attributes to an Existing Model {time="00:15:00"}


  #. Manually create a migration:

    ~~~
    rails g migration AddArtistFormationDate
    ~~~

  #. Edit the matching migration file:

    ~~~
    db/migrate/NNNNNNNNNNNNNN_add_artist_formation_date.rb
    ~~~

  #. Add the following line to the `change` method:

    ~~~ {.ruby}
    add_column(:artists, :formation_date, :datetime)
    ~~~

  #. Migrate the database:

    ~~~
    rake db:migrate
    ~~~

  #. Open and review the `db/schema.rb` file.

  #. Edit the `app/views/artists/_form.html.erb` partial.  Add a form
     field for the newly added `formation_date` attribute:

    ~~~ {.html}
    <div class="field">
      <%= f.label :formation_date %><br>
      <%= f.date_select :formation_date %>
    </div>
    ~~~

  #. Edit the `app/controllers/artists_controller.rb` and allow
     forms to specify `formation_date`:

    ~~~ {.ruby}
    params.require(:artist).permit(:name, :formation_date)
    ~~~

  #. Get the tests to pass.

  #. Try everything out in the Rails server:

    ~~~
    rails server
    ~~~

Noteworthy points:

  * Since we already have data in our database it's hard to add a `NOT
    NULL` constraint on this column.  It could be added later after
    all of the exiting records have been updated.

  * Sometimes you can set a `default:` option which (in some
    databases) will automatically set the new column in existing
    records.

  * Under most circumstances, you shouldn't edit an existing
    migration, especially after the migration has run in production.

  * A list of column types can be found [in the API docs][cols].

[cols]: http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html#method-i-column

### Adding Another Table to the Mix {time="00:10:00"}

  #. Generate a new model, test, and migration:

    ~~~
    rails g model album
    ~~~

  #. Edit the migration file and add update the `change` method to
     look like this:

    ~~~ {.ruby}
    def change
      create_table :albums do |t|
        t.references(:artist, null: false, index: true) # Foreign key.
        t.string(:name, null: false)
        t.datetime(:release_date, null: false)
        t.timestamps(null: false)
      end
    end
    ~~~

  #. Open and review the `db/schema.rb` file.


Noteworthy points:

  * Don't forget to create indices for your associations/foreign keys.

### Connecting Artists and Albums {time="00:10:00"}

  #. Open the artist model file (`app/models/artist.rb`).

  #. Since artists have a one-to-many relationship with albums, we'll
     express that with the `has_many` helper method:

    ~~~ {.ruby}
    class Artist < ActiveRecord::Base
      has_many(:albums)
    end
    ~~~

  #. Optionally reciprocate the relationship by using the `belongs_to`
     method in the albums model:

    ~~~ {.ruby}
    class Album < ActiveRecord::Base
      belongs_to(:artist)
    end
    ~~~

Noteworthy points:

  * Notice the use of singular and plural nouns.

</div>

### Database Relations: One to One {time="00:03:00"}

![](diagrams/ruby/rails/db-has_one.pdf)

### Database Relations: One to Many {time="00:03:00"}

![](diagrams/ruby/rails/db-has_many.pdf)

### Database Relations: Many to Many {time="00:03:00"}

![](diagrams/ruby/rails/db-habtm.pdf)

### Expressing Associations in Rails {time="00:05:00"}

| Association  | Owner                     | Reciprocal    |
|--------------+---------------------------+---------------|
| One to one   | `has_one`                 | `belongs_to`  |
| One to many  | `has_many`                | `belongs_to`  |
| Many to many | `has_and_belongs_to_many` | Same as owner |

*And a few other exotic associations...*

<div class="notes">

### Playing with the New Association {time="00:05:00"}

  #. Start the Rails console:

    ~~~
    rails c
    ~~~

  #. Create a new artist and a new album:

    ~~~ {.ruby}
    a = Artist.new(name: "Sneaker Pimps", formation_date: "1994-01-01")
    a.albums.new(name: "Becoming X", release_date: "1996-08-19")
    a.save!
    ~~~

Noteworthy points:

  * Notice that the strings given to the `new` method are
    automatically converted into the correct type.  This is an
    important feature that allows models to be constructed from HTML
    forms.

### Seeding the Database with Default Data {time="00:10:00"}

  #. Open the `db/seeds.rb` file.

  #. Add a default set of artists and albums:

    ~~~ {.ruby}
    Artist.create! do |a|
      a.name = "The Knife"
      a.formation_date = "1999-01-01"
      a.albums.new(name: "The Knife",    release_date: "2001-02-5")
      a.albums.new(name: "Deep Cuts",    release_date: "2003-01-17")
      a.albums.new(name: "Silent Shout", release_date: "2006-02-17")
    end

    Artist.create! do |a|
      a.name = "Sneaker Pimps"
      a.formation_date = "1994-01-01"
      a.albums.new(name: "Becoming X", release_date: "1996-08-19")
      a.albums.new(name: "Splinter",   release_date: "1999-01-01")
    end
    ~~~

  #. Kill the Rails server if it is running using `Control-C`.

  #. Reset the database.

    ~~~
    rake db:reset
    ~~~

Noteworthy points:

  * If you want to seed the database multiple times you can add
    conditional expressions to keep from creating the same records
    more than once.

### The Relational Algebra Library (arel) {time="00:10:00"}

  #. Start the Rails console.

  #. Issue a few queries:

    ~~~ {.ruby}
    Artist.where("formation_date >= ?", "1970-01-01")
    Artist.where("formation_date >= ?", "1970-01-01").order(:name).first
    Artist.where("formation_date >= ?", "1970-01-01").count
    Artist.where(name: "The Knife").where("formation_date >= ?", "1970-01-01")

    a = Artist.first
    a.albums.where("release_date > ?", "1970-01-01").count
    ~~~

Noteworthy points:

  * **NEVER, ever,** use a variable inside the first argument to
    `where`.  Use a question mark ("`?`") and additional arguments to
    properly escape any SQL that might be in the variable.

  * Chaining `where` methods together combines them with `AND`.  To
    create an `OR` connection you'll have to give `where` a string and
    do it yourself.

  * You can tack on `to_sql` to the end of an `arel` chain to see the
    SQL it will run on the database.

  * The best place to use these `arel` methods is from inside a
    model.  You can write class methods that return a pre-made query
    or use [scopes][].

  * The most common `arel` methods are documented in the
    [ActiveRecord::QueryMethods][QueryMethods] module.

[querymethods]: http://api.rubyonrails.org/classes/ActiveRecord/QueryMethods.html
[scopes]: http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html#method-i-scope

### Server-side vs. Database Validations {time="00:10:00"}

  #. What happens if you execute the following code in the console?

    ~~~ {.ruby}
    Artist.create
    ~~~

    Answer: It raises an exception because the database has a non-null
    constraint on the `name` column.

  #. Open the artist model and add the following code:

    ~~~ {.ruby}
    validates_presence_of(:name)
    ~~~

  #. Back in the console, execute the following:

    ~~~ {.ruby}
    reload! # Reload the Rails application
    Artist.create
    a = _ # Assign the result of last expression to `a'
    a.new_record?
    a.errors
    a.errors.full_messages
    ~~~

Noteworthy points:

  * If you forget to make an assignment in `irb` you can always access
    the result of the last expression with the underscore variable
    ("`_`").

  * Adding validations on top of database constraints helps create
    useful error messages for the user interface.

</div>


### Model Validation Methods {time="00:05:00"}

There are a lot of validation methods and they all take many options
to control how they work:

|--------------------------+-----------------------------|
| `validates_presence_of`  | `validates_format_of`       |
| `validates_length_of`    | `validates_numericality_of` |
| `validates_inclusion_of` | `validates_uniqueness_of`   |
| and several more...      |                             |

And they can also be written in another form:

~~~ {.ruby}
validates(:name, presence: true)
~~~

### Model Life Cycle {time="00:05:00"}

![](diagrams/ruby/rails/model-lifecycle.pdf)

<div class="notes">

Noteworthy points:

  * This graph represents the steps taken to create a new record.  If
    you are updating an existing record the steps are the same except
    the callback names will end with "update" instead of "create".

  * You can hook into any step in the process by defining callback
    methods or using one of the callback helpers such as
    `before_save`.

  * More information can be found in the [Rails Callback Guide][].

</div>

[rails callback guide]: http://guides.rubyonrails.org/active_record_callbacks.html

## Active Support: A Huge Bag of Monkey Patching

### What is Active Support? {time="00:03:00"}

From the documentation:

> Active Support is a collection of utility classes and standard
> library extensions that were found useful for the Rails
> framework. These additions reside in this package so they can be
> loaded as needed in Ruby projects outside of Rails.

In other words, Active Support is a collection of methods for Ruby
core classes, A.K.A. monkey patching.

### Example: Two Very Useful Methods {time="00:03:00"}

In Rails (via Active Support), all objects respond to `blank?` and
`present?`:

~~~ {.ruby}
Artist.new.blank?   # => false
Artist.new.present? # => true

"".blank?           # => true
"".present?         # => false

nil.blank?          # => true
nil.present?        # => false

false.blank?        # => true
false.present?      # => false
~~~

### Another Way to Guard Against `nil` Objects {time="00:05:00"}

The `try` method will call a method if the receiver isn't `nil`:

~~~ {.ruby}
Artist.new.try(:name)
~~~

### Core Methods and View Methods {time="00:05:00"}

Everywhere in Rails:

~~~ {.ruby}
"Hello World".truncate(5) # => "He..."
"Fox".pluralize           # => "Foxes"
~~~

View-specific versions:

~~~ {.ruby}
truncate("Hello World", 5) # => "He..."
pluralize(2, "Fox")        # => "2 Foxes"
~~~

### Lab: Using View Helpers {time="00:10:00"}

Instructions:

  #. Open the artists index view: `app/views/artists/index.html.erb`

  #. Update the "Name" column so that it includes the correct number
     of albums for each artist. (Hint: use the `pluralize` view
     helper.)

  #. Start the Rails server and review your handy work.

### Reference Implementation {time="00:03:00"}

~~~
<td>
  <%= artist.name %>
  (<%= pluralize(artist.albums.count, "album") %>)
</td>
~~~

### Other Useful Helper Methods {time="00:03:00"}

Everywhere in Rails:

~~~ {.ruby}
2.years.from_now        # => "Fri, 02 Sep 2016 20:26:18 UTC +00:00"
Time.now.to_s(:short)   # => "19 Aug 15:18"
Time.now.to_s(:iso8601) # => "2014-08-19T15:19:14-06:00"

1234567.to_s(:human)            # => "1.23 Million"
1234567890123.to_s(:human_size) # => "1.12 TB"

%w(Earth Wind Fire).to_sentence # => "Earth, Wind, and Fire"
~~~

In other words, there are a *ton* of formatting helper methods in
Rails.  If you need to format an object for the UI, look at Active
Support first.

## Nested Routing

<div class="notes">

### Creating the Album UI {time="00:10:00"}

  #. Generate a controller and associated views:

    ~~~
    rails g controller Albums
    ~~~

*Note:* controllers are created by providing their name to the
generator, which is usually the plural version of the model name.

### Nesting Albums Underneath Artists {time="00:10:00"}

  #. Edit the routing file, nesting albums like so:

    ~~~ {.ruby}
    resources(:artists) do
      resources(:albums)
    end
    ~~~

  #. Review the routing table:

    ~~~
    rake routes
    ~~~

### A Better Way to Write Controller Actions {time="00:10:00"}

  #. Open the application controller file:

        app/controllers/application_controller.rb

  #. Add the following line:

    ~~~ {.ruby}
    respond_to(:html, :json)
    ~~~

  #. Write controller actions with `respond_with` instead of
     `respond_to`:

    ~~~ {.ruby}
    respond_with(@artist, @album)
    ~~~

Noteworthy points:

  * You could actually replace all of the generated controller methods
    so they simply call `respond_with(...)`.  I'm not sure why they
    don't already do this.

  * For nested resources, `respond_with` can take multiple arguments
    (unlike other methods such as `form_for` which force you to give
    them an array).

  * The `respond_with` method can take a block just like `respond_to`,
    allowing you to override the default handlers.

### Completing the Albums Controller {time="00:30:00"}

  #. Create the necessary controller actions and callbacks for albums:

    * `new`
    * `create`
    * `edit`
    * `update`
    * `destroy`

    ~~~ {.ruby}
    before_action :set_artist
    # ...
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
    ~~~

  #. Create the following album views:

    * `_form.html.erb`
    * `new.html.erb`
    * `edit.html.erb`

  #. Make sure your `_form.html.erb` use of `form_for` looks like this:

    ~~~ {.html}
    <%= form_for([@artist, @album]) do |f| %>
    ~~~

  #. Update the `artists#show` page to include an album list with
     links for creating new albums and editing existing albums.

  #. Try things again in the server, this time going back to the root
     of the application: <http://localhost:3000/>

</div>

### Lab: Adding Songs to the Discography Application

Instructions:

  #. Create a `Song` model, a matching controller, and views.

     Songs should be nested under albums.

  #. Update the `seeds.rb` file to add songs.

Hint: The `songs` table should have a foreign key to the `albums`
table (i.e. `album_id`).

## The Rails Asset Pipeline

### What is the Asset Pipeline? {time="00:03:00"}

Rails helps you manage various static assets:

  * CSS (joining and compressing)

  * JavaScript (obfuscating, joining, and compressing)

  * Images

### Features Provided by the Asset Pipeline {time="00:03:00"}

  * Use assets from third-party gems

  * Preprocess assets (e.g., Sass to CSS, CoffeeScript to JavaScript,
    etc.)

  * Cache management via fingerprints and cache busting

  * Deploy assets to a CDN

### The Asset Pipeline and Rails Environments {time="00:03:00"}

  * In `development` mode, assets are live compiled

  * For `production`, you'll want to precompile them

### Asset Manifest Files {time="00:05:00"}

The asset pipeline uses manifest files to know which assets you want
compiled into an asset bundle.  Let's take a look at them:

  #. Open the JavaScript manifest file:

        app/assets/javascripts/application.js

     Notice the "`//= require`" lines.  These lines tell the
     preprocessor to include matching files into the asset bundle.
     Since they are JS comments, they'll be removed when compiled.

  #. Open the CSS manifest file:

        app/assets/stylesheets/application.css

### Sass: An Alternative to CSS {time="00:05:00"}

[Syntactically Awesome Style Sheets][sass]:

~~~
$logo_color: #3bbfce;

table {
  thead {
    td {color: $logo_color;}
  }
}
~~~

  * Example file name: `app/assets/stylesheets/tables.css.scss`

  * Highly recommended

[sass]: http://sass-lang.com/

### CoffeeScript: An Alternative to JavaScript {time="00:03:00"}

[CoffeeScript](http://coffeescript.org/):

~~~
alert "I knew it!" if elvis?
~~~

  * A Ruby-like language that compiles to JavaScript

  * Compiled by the asset pipeline, the browser never sees
    CoffeeScript

  * Example file name: `app/assets/javascripts/foo.js.coffee`

### Haml: An Alternative to HTML and ERB {time="00:03:00"}

[Haml](http://haml.info/):

~~~
%table
  %thead
    %th
      %td Name
      %td Links
~~~

  * Alternative view language (instead of ERB)

  * Example file name: `app/views/artists/index.html.haml`

# Diving Deeper into Rails

> Kids who are good at traditional school—repeating rote concepts and
> facts on a test—can fall apart in a situation where that isn’t
> enough. Programming rewards the experimental, curious mind.
> -- Ketil Moland Olsen

## Rails Initialization and Configuration

### Initialization Order {time="00:03:00"}

Rails applications are started in (roughly) this order:

  #. `config/application.rb`

  #. `config/initializers/*.rb`

  #. `config/environments`/*\<environment\>*

### The `application.rb` File {time="00:05:00"}

Creates a module named after your application that contains an
`Application` class that allows you to change basic Rails settings.

### The `initializers` Directory {time="00:05:00"}

More configuration, spread across several files by Rails feature.

### Environment-specific Configuration {time="00:05:00"}

  * Each Rails environment has a configuration file in the
   `config/environments` directory.

  * Creating a new environment is as simple as copying one of the
    existing configuration file (usually `production.rb`).

  * Rails checks the `RAILS_ENV` environment variable to know which
    environment to use.  As we've seen, `development` is the default.

### Two Very Important Configuration Files {time="00:05:00"}

  * `config/database.yml` contains database credentials for each
    environment.  Don't put production details in this file (and thus
    into your source code control system), instead, keep a private
    configuration file in production.

  * `config/secrets.yml` is a place for you to store API keys and
    other sensitive information.  Follow the same advice as with the
    database configuration and don't put real production details in
    your version control system.

<div class="notes">

You can access entries in the `secrets.yml` file from anywhere in your
code using the secrets API.  For example, if you want to get the value
of the `secret_key_base` entry you can use the following code:

~~~ {.ruby}
Rails.application.secrets.secret_key_base
~~~

</div>

### Internationalization {time="00:05:00"}

  * The `config/locales` directory contains YAML files which can be
    automatically loaded based on a user's language setting.

  * Any user-facing language should be stored in one of these files.

  * Use the `t` method to pull strings from the language files.

  * For more information, see the [Internationalization Guide] [].

[internationalization guide]: http://guides.rubyonrails.org/i18n.html

## Representational State Transfer

### Introduction to REST {time="00:03:00"}

[Representational State Transfer][rest] (REST) is a style of web-base
APIs for working with remote resources.  The main features include:

  * Simpler than alternatives such as RPC and SOAP

  * Makes heavy use of HTTP via URLs and request methods (e.g., GET,
    POST, DELETE, PATCH, etc.)

  * Resources can be represented using any data format; JSON and XML
    are the most common

  * Since it relies on HTTP, it's stateless

### Using REST {time="00:03:00"}

To use a REST resource you only need to:

  #. Know the URL for the resource

  #. Perform an HTTP GET to fetch the resource

  #. Perform an HTTP PATCH to update the resource, --or--

  #. Perform an HTTP POST to create a new resource

### Our Application is Ready for REST {time="00:05:00"}

  #. Start your Rails server.

  #. Point your browser to <http://localhost:3000/artists.json>

  #. Look at the routing table again:

    ~~~
    rake routes
    ~~~

  #. Notice: `(.:format)`

  #. Look at the following view:

        app/views/artists/index.json.jbuilder

     This is a [Jbuilder][] view.  It's a Ruby DSL for generating
     JSON.  It allows you to have very specific control over the JSON
     being generated for your models.

### Ruby on Rails and REST {time="00:03:00"}

Rails is heavily invested in REST:

  * Creating routes with the `resources` method creates RESTful URLs

  * The default set of controller methods correspond to REST URLs

  * The generated HTML forms make REST requests but transfer the
    resource as HTTP-encoded form data

  * That means we've been using REST the whole time!

### Updating the Artists Controller to Respond with XML {time="00:10:00"}

  #. Open the application controller file:

        app/controllers/application_controller.rb

  #. Update the `respond_to` line.

    ~~~ {.ruby}
    respond_to(:html, :xml, :json)
    ~~~

  #. Make REST requests to the index action for both JSON and XML:

     - <http://localhost:3000/artists.json>
     - <http://localhost:3000/artists.xml>

<!-- In Emacs use:

  M-x httprepl

-->

## Session Management, Cookies, and Security Considerations

### Introduction to Session Management {time="00:03:00"}

  * HTTP is stateless and uses cookies to maintain state

  * Sessions are built on top of HTTP cookies

  * There are two parts:

    #. A unique session ID for each HTTP client
    #. A hash where you can store anything for that session ID

  * Sessions are enabled by default in Rails 4.x

### Session IDs and the Session Store {time="00:05:00"}

  * Rails stores both the session ID and store in the browser using
    encrypted cookies

  * You can also choose to keep the session store server-side in the
    database, file system, network memory cache, etc.

  * I recommend you keep them in cookies now that Rails fully encrypts
    them

  * But you should only ever store very simple data in the session
    store

<div class="notes">

Noteworthy points:

  * All of the HTML requests we've been making thus far have been
    creating session IDs and setting session cookies.

  * GitHub uses an [interesting hybrid approach] [github-cookies] to
    Rails sessions.

</div>

[github-cookies]: https://github.com/blog/1661-modeling-your-app-s-user-session


### What the Session Store is Good For {time="00:03:00"}

  * Storing small, simple data types like integers and strings

  * Mostly useful for storing the user IDs

  * Don't store anything more complicated

<div class="notes">

Noteworthy points:

  * Putting something in the session store means it needs to be
    serialized.

  * Storing objects more complex than an integer exposes you to the
    risk that you can't deserialize it, especially when you alter the
    definition of the data type.

  * Watch out, the cookie store has an upper limit of 4k (after
    serializing and encrypting).

</div>

### Problems that Come When Maintaining State {time="00:03:00"}

  * An object can't be deserialized

  * Session reply attacks (please, once you start using sessions, use
    an SSL/TLS certificate)

  * If you are storing sessions server-side they will need to be
    expired/removed frequently

### Session Advice {time="00:03:00"}

  * Use the cookie store, it's fast and safe (since Rails 4.0)

  * Protect your users and your data with SSL/TLS certificates

  * Only store a user ID in the session, keep everything else in the
    database (e.g., shopping carts)

  * Check with legal about cookie guidelines

<div class="notes">

Noteworthy points:

  * In 2012 a new EU law governing HTTP cookies went into effect.
    Check with your legal department to find out if you need to
    comply.

</div>

## Authentication and Authorization

### Performing Authentication and Authentication in Rails {time="00:03:00"}

  * Authentication: confirming someone is who they say they are

  * Authorization: confirming someone can perform a specific task

  * Rails only provides rudimentary building blocks for these tasks

  * We'll be using two RubyGems: Devise and Pundit

### Introduction to the Devise RubyGem {time="00:03:00"}

The [Devise] [] RubyGem provides many modular authentication features:

  * Correctly one-way encrypts user passwords

  * Password resetting with sending reset emails

  * Account locking after N failed attempts

  * Multi-provider authentication (LDAP, Facebook, etc.)

  * The de facto standard for authentication in Rails

<div class="notes">

Noteworthy points:

  * Installing and using Devise isn't a simple task.  We're going to
    work though the instructions together and learn a few new things
    along the way.

</div>

### Integrating Devise into Our Application

We'll be following (and interpreting) the following instructions:

<https://github.com/plataformatec/devise#user-content-getting-started>

<div class="notes">

#### Outline of the Steps We'll Take  {time="01:30:00"}

  #. Find out the current version of Devise:

    ~~~
    gem list --remote devise | head
    ~~~

  #. Add Devise to the `Gemfile`:

    ~~~ {.ruby}
    gem('devise', '3.3.0')
    ~~~

  #. Use Bundler to install the gem and its dependencies:

    ~~~
    bundle install
    ~~~

  #. Generate a default Devise configuration file:

    ~~~
    rails generate devise:install
    ~~~

  #. Review the Devise configuration file:

    ~~~
    config/initializers/devise.rb
    ~~~

    At the very least, change the sender email address.  The secret
    key can be left commented out since it's automatically taken from
    `config/secrets.yml` in Rails 4.1.  Everything else should be
    configured to your liking.

    If you do enable a pepper, take it from the Rails secret system
    instead of hard-coding the value:

    ~~~ {.ruby}
    config.pepper = Rails.application.secrets.pepper
    ~~~

  #. Configure the application's host name for including links in
     emails.

    You can set it in the `config/application.rb` file and then
    override it in the individual environment files.

    ~~~ {.ruby}
    config.action_mailer.default_url_options = {
      :host => 'localhost',
      :port => 3000,
    }
    ~~~

  #. Disable mail delivery in `development` mode by editing the
     development environment configuration and adding the following
     line:

    ~~~ {.ruby}
    config.action_mailer.delivery_method = :test
    ~~~

  #. We already have a default route in the routing file, so we can
     skip that step.  After a user logs into the application Devise
     redirects them to the default route, which is specified like so:

    ~~~ {.ruby}
    root('artists#index')
    ~~~

  #. Add flash messages to the `app/views/layouts/application.html.erb` file:

    ~~~ {.html}
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
    ~~~

  #. We won't be customizing the Devise views, so we won't copy them
     into our application.  When you want to customize them it's best
     to use the provided generator (`rails g devise:views`) to copy
     them into your application's view directory.

  #. Generate a `User` model:

    ~~~
    rails generate devise User
    ~~~

  #. Edit the new `User` model and enable desired Devise modules:

    ~~~ {.ruby}
    devise(:database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable,
           :validatable, :lockable)
    ~~~

  #. Edit the generated migration to match the model.  To keep things
     simple, we won't be adding any custom attributes right now.
     (Remember, you can always create another migration in the future
     to add any missing columns.)

    ~~~
    db/migrate/NNNNNNNNNNNNNN_devise_create_users.rb
    ~~~

  #. Migrate the database:

    ~~~
    rake db:migrate
    ~~~

  #. Force the entire application to require authentication by editing
     the application controller and adding the following line:

    ~~~ {.ruby}
    before_action(:authenticate_user!)
    ~~~

    In a real application you might want to only protect certain
    sections of the application.

  #. Take a look at the routes that Devise added:

    ~~~
    rake routes
    ~~~

  #. Add the following to the application layout:

    ~~~ {.html}
    <% if user_signed_in? %>
      <%= link_to('Sign Out',
                  destroy_user_session_path,
                  method: :delete) %>
    <% end %>
    ~~~

  #. Start the server, then:

    #. Create an account.
    #. Log out.
    #. Request a password reset.
    #. Look at the email in the development log.

  #. Take a look at the following file:

    ~~~
    config/locales/devise.en.yml
    ~~~

</div>

### Devise Helper Methods {time="00:05:00"}

  * `user_signed_in?` - Returns `true` or `false`.

  * `current_user` - Returns a `User` object.

  * `authenticate_user!` - Controller method to force authentication.

### Devise and Testing Considerations {time="00:03:00"}

By including the `Devise::TestHelpers` module, your controller tests
can use methods like `sign_in(@user)` to get past authentication and
run the actual tests.

### Introduction to the Pundit RubyGem {time="00:03:00"}

[Pundit] [] is a RubyGem that provides policy-based authorization with
the following features:

  * Tiny library that's easier to understand than others

  * Authorization based on users and resources

  * Can be used from controllers and views

  * Easy to customize

### Integrating Pundit into Our Application

We'll be following (and interpreting) the following instructions:

<https://github.com/elabs/pundit#user-content-installation>

<div class="notes">

#### Outline of the Steps We'll Take {time="00:45:00"}

  #. Figure out the current version of Pundit:

    ~~~
    gem list --remote pundit | head
    ~~~

  #. Add Pundit to the `Gemfile`:

    ~~~ {.ruby}
    gem('pundit', '0.3.0')
    ~~~

  #. Ask Bundler to install the gem:

    ~~~
    bundle install
    ~~~

  #. Generate the default application policy file:

    ~~~
    rails g pundit:install
    ~~~

  #. Review the application policy file:

    ~~~
    app/policies/application_policy.rb
    ~~~

  #. Generate a policy for artists:

    ~~~
    rails g pundit:policy artist
    ~~~

  #. Edit the artist policy:

    ~~~
    app/policies/artist_policy.rb
    ~~~

    And add something like the following:

    ~~~ {.ruby}
    def allow_viewing?
      true
    end

    def allow_mutation?
      @user && @user.sign_in_count > 2
    end

    alias_method(:index?,   :allow_viewing?)
    alias_method(:show?,    :allow_viewing?)
    alias_method(:create?,  :allow_mutation?)
    alias_method(:update?,  :allow_mutation?)
    alias_method(:destroy?, :allow_mutation?)
    ~~~

  #. Allow controllers to use Pundit helper methods by adding the
     following line to the application controller:

    ~~~ {.ruby}
    include(Pundit)
    ~~~

  #. Enable policy checking in the artist controller by adding one of
     the following lines to each of the controller actions:

    ~~~ {.ruby}
    # For the index action:
    authorize(@artists)

    # For all other actions:
    authorize(@artist)
    ~~~

  #. Force all actions in the artist controller to be authorized by
     adding the following line:

    ~~~ {.ruby}
    after_action(:verify_authorized)
    ~~~

  #. Start the server and try to create an artist.  Change the number
     of times you've signed in by modifying your user object in the
     console.

  #. Add the following to the `test/test_helper.rb` file:

    ~~~ {.ruby}
    class ActionController::TestCase
      include(Devise::TestHelpers)
    end
    ~~~

</div>

### Pundit Key Points {time="00:10:00"}

  * The `authorize` method checks the policy method corresponding to
    the current controller action.

  * Control database scopes by:
    - Adding logic to the policy `Scope` class
    - Using the `policy_scope` method

  * Filter form parameters by:
    - Writing a `permitted_attributes` method in your policy class
    - Permitting those attributes in the controller's strong params
      checker method (see the Pundit docs on strong params)

### Pundit Helper Methods {time="00:05:00"}

  * The `policy` method can be used from controller and views to
    return an instance of the correct policy

  * The `authorize` controller method is used to actually perform the
    policy checking

  * The `verify_authorized` controller method raises an exception
    unless `authorize` was called

### DIY Role-based Authorization with Pundit {time="00:05:00"}

![](diagrams/ruby/rails/roles.pdf)

### Pundit and Testing Considerations {time="00:03:00"}

Pundit, like Devise, includes test helpers so you can test your policy
files.  Unfortunately, they only work with RSpec.

## Replacing Fixtures with FactoryGirl

### Reviewing Test Fixtures {time="00:03:00"}

  * Each time we've generated a model Rails gave us a test file and a
    fixture file to go with it

  * Fixtures are YAML (or CSV) files in the `test/fixtures` directory

  * Each model has one fixture file that creates fake records in the
    test database

  * They're not as useful as you might think, and often complicate the
    test files

  * Let's get rid of them and replace them with `FactoryGirl`

### Introduction to the FactoryGirl RubyGem {time="00:03:00"}

FactoryGirl is:

   * A DSL for defining reusable test data

   * For each model you create one factory that can create a
     completely valid object

   * In tests you can use that factory to create test objects, and at
     the same time, override factory values

### Installing FactoryGirl, and Bundler Groups {time="00:08:00"}

  #. Add the [factory_girl_rails][factory_girl] gem to your `Gemfile`,
     but this time in the `test` group:

    ~~~ {.ruby}
    group(:test) do
      gem('factory_girl_rails', '4.4.1')
    end
    ~~~

    *or:*

    ~~~ {.ruby}
    gem('factory_girl_rails', '4.4.1', group: :test)
    ~~~

  #. Run `bundle install`

### Writing Our First Factory Files {time="00:20:00"}

  #. Open the `test/test_helper.rb` file.

  #. Remove the "`fixtures :all`" line.

  #. Create a new file: `test/factories.rb`

  #. Let's build some factories!

<div class="notes">

Noteworthy points:

  * By default, you usually have one factory for each model.

  * Here's an example factories file:

    ~~~ {.ruby}
    FactoryGirl.define do
      sequence :email do |n|
        "email#{n}@example.com"
      end

      factory(:album) do
        name("Deep Cuts")
        release_date("2003-01-17")
        artist
      end

      factory(:artist) do
        name("The Knife")
        formation_date("1999-01-01")
      end

      factory(:user) do
        email
        sign_in_count(50)
        password("foobar$$$")
        password_confirmation("foobar$$$")
      end
    end
    ~~~

  * To get past our site-wide authentication system you need to log in
    a fake user from within the tests.  Here's one way to do that in
    the `test/test_helper.rb` file:

    ~~~ {.ruby}
    class ActionController::TestCase
      include(Devise::TestHelpers)

      setup do
        @current_user = FactoryGirl.create(:user)
        sign_in(@current_user)
      end
    end
    ~~~

  * Since we removed the fixtures, we need to update the tests to use
    factories instead.  Here are some replacement `setup` methods:

    ~~~ {.ruby}
    class ArtistsControllerTest < ActionController::TestCase
      setup do
        @artist = FactoryGirl.create(:artist)
      end
      # ...
    end

    class AlbumsControllerTest < ActionController::TestCase
      setup do
        @artist = FactoryGirl.create(:artist)
        @album = FactoryGirl.create(:album, artist: @artist)
      end
      # ...
    end
    ~~~

</div>

## Basic Testing with RSpec

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

### Adding RSpec to Our Application {time="00:10:00"}

  #. Add the `rspec-rails` gem to the `development` and `test` groups.

  #. Run `bundle install`

  #. Bootstrap RSpec with the following command:

    ~~~
    rails generate rspec:install
    ~~~

### Writing and Running Our First Spec

Let's generate and fill in a controller spec:

  #. Have Rails and RSpec generate a new test file for us:

    ~~~
    rails generate rspec:controller artists
    ~~~

  #. Open this file and let's play with spec testing!

  #. When you're ready to run your tests, here's the command:

    ~~~
    rake rspec
    ~~~

<div class="notes">

#### Outline of the Steps We'll Take  {time="00:10:00"}

  #. We need working factories, so let's load FactoryGirl into RSpec.
     Add the following lines to the `spec/rails_helper.rb` file:

    ~~~ {.ruby}
    RSpec.configure do |config|
      config.include(FactoryGirl::Syntax::Methods)
      # ...
    end
    ~~~

  #. We'll also need to authenticate with Devise.  While you have the
     `spec/rails_helper.rb` file open, add the following line:

    ~~~ {.ruby}
    config.include(Devise::TestHelpers, type: :controller)
    ~~~

  #. Fill in your controller test with something like this:

    ~~~ {.ruby}
    RSpec.describe ArtistsController, :type => :controller do
      before do
        @current_user = create(:user)
        sign_in(@current_user)
      end

      context "GET index" do
        it "responds with a successful HTTP status" do
          get(:index)
          expect(response).to be_success
        end
      end
    end
    ~~~

  #. Run the tests:

    ~~~
    rake spec
    ~~~

  #. If you decide to disable warnings, edit the `.rspec` file at the
     root of the project and remove the line containing
     "`--warnings`".  You might also hear the Ruby fairies crying.

</div>

# Practical Ruby on Rails

> Sometimes abstraction and encapsulation are at odds with
> performance---although not nearly as often as many developers
> believe---but it is always a good practice first to make your code
> right, and then make it fast. -- Brian Goetz

## Managing Complexity and Business Logic

### Techniques for Managing Complexity in Rails {time="00:03:00"}

  * Don't abandon object-oriented programming

  * Model business logic with a state machine

  * Move work to a background work queue

### Keep the Model-view-controller Layers Slim {time="00:03:00"}

  * Keep business logic out of the controllers, and especially out of
    the views

  * Use Pundit and policies to add authorization logic

  * Don't let your models turn into gigantic classes

  * Use the `lib` directory to create business logic libraries

### Inheriting from a Model {time="00:03:00"}

  * There are two types of model inheritance in Rails

    - All children share the same database table (default)
    - Normal, object-oriented class inheritance

  * The default table sharing scheme is called Single Table
    Inheritance (STI)

  * Carefully consider if inheritance is the right solution

<div class="notes">

Noteworthy points:

  * If you inherit from a model, the default behavior is to share the
    database table and use a `type` column to keep the class name.

  * You can disable this behavior by:

    In the parent class:

    ~~~ {.ruby}
    self.abstract_class = true
    ~~~

    *or* in the child class:

    ~~~ {.ruby}
    self.inheritance_column = :_type_disabled
    ~~~

</div>

### Abstracting Functionality into a Plug-in or Engine {time="00:03:00"}

When working on more than one Rails application...

  #. You can extract code from `lib` and make a plug-in (gem)

     - Think of Pundit

  #. Or extract an entire Rails app and make an engine (gem)

     - Think of Devise

### Polymorphic Associations {time="00:05:00"}

![](diagrams/ruby/rails/poly.pdf)

<div class="notes">

Noteworthy points:

  * Polymorphic associations require two foreign keys, one for the
    class name and one for the ID.

  * Slightly complicates raw database access and reporting.

  * Make sure you set up the appropriate indices.

</div>

### Let's Use Polymorphic Associations

Fire up your text editor, let's let people add comments to artist and
albums!

<div class="notes">

#### Outline of the Steps We'll Take  {time="00:45:00"}

  #. Generate a `Comment` model:

    ~~~
    rails g model Comment
    ~~~

    (Notice that Rails is now generating spec files.)

  #. Edit the migration to look like this:

    ~~~ {.ruby}
    create_table :comments do |t|
      t.text(:comment, null: false)
      t.references(:user, null: false, index: true)
      t.references(:commentable, polymorphic: true, null: false, index: true)
      t.timestamps(null: false)
    end
    ~~~

  #. Add validations and associations to the comment model:

    ~~~ {.ruby}
    validates_presence_of(:comment)
    belongs_to(:user)
    belongs_to(:commentable, polymorphic: true)
    ~~~

  #. Add associations to the artist and album model:

    ~~~ {.ruby}
    has_many(:comments, as: :commentable)
    ~~~

  #. Open the console and see the SQL generated by Rails:

    ~~~ {.ruby}
    a = Artist.first
    a.comments
    c = a.comments.new
    c.commentable
    ~~~

  #. Create the controller and views for comments:

    ~~~
    rails g scaffold_controller Comment comment:text
    ~~~

  #. Configure the routing table for comments:

    ~~~ {.ruby}
    resources(:artists) do
      resources(:comments)
      resources(:albums) do
        resources(:comments)
      end
    end
    ~~~

  #. Update the `respond_to` line in the application controller:

    ~~~ {.ruby}
    respond_to(:html, :xml, :json, :js)
    ~~~

  #. Create a `comments/_comment.html.erb` partial:

    ~~~ {.html}
    <li><%= comment.comment %></li>
    ~~~

  #. Update the comments controller to properly scope comments:

    ~~~ {.ruby}
    before_action(:set_parents)

    # ...

    def create
      @comment = @parents.last.comments.new(comment_params)
      @comment.user = current_user
      @comment.save
      respond_with(@comment)
    end

    # ...

    def set_parents
      @parents = []
      @parents << Artist.find(params[:artist_id]) if params.has_key?(:artist_id)
      @parents << Album.find(params[:album_id])   if params.has_key?(:album_id)
    end

    def set_comment
      @comment = @parents.last.comments.find(params[:id])
    end
    ~~~

  #. Update the artist show page to have somewhere for existing
     comments, a new comment form, and a new comment link:

    ~~~ {.html}
    <h2>Comments</h2>

    <ul id="comments">
      <%= render(@artist.comments) %>
    </ul>

    <div id="new-comment">
    </div>

    <%= link_to('New Comment',
                new_artist_comment_path(@artist),
                remote: true) %> |
    ~~~

  #. Update the comments form to make it polymorphic and remote:

    ~~~ {.html}
    <%= form_for(@parents + [@comment], remote: true) do |f| %>
    ~~~

  #. Create a new JavaScript view for `comments#new` in
     `app/views/comments/new.js.erb`:

    ~~~ {.javascript}
    var h = "<%= escape_javascript(render('form')) %>";
    $("#new-comment").html(h).show();
    ~~~

  #. Create a JS view for the `comments#create` action in
     `app/views/comments/create.js.erb`:

    ~~~ {.javascript}
    var h = "<%= escape_javascript(render(@comment)) %>";
    $("#comments").append(h);
    $("#new-comment").hide();
    ~~~

</div>

### Taming Business Logic with State Machines {time="00:04:00"}

Another way to deal with complex business logic is by defining a state
machine.  There are several pure-Ruby solutions:

  * [state_machine](https://github.com/pluginaweek/state_machine)

  * [transitions](https://github.com/troessner/transitions)

  * [AASM](https://github.com/aasm/aasm)

### Offloading Work to a Background Queue {time="00:05:00"}

[Active Job](https://github.com/rails/rails/tree/master/activejob) is
an abstraction over background queues.  It was an independent RubyGem,
and will now be part of Rails 4.2.  Example applications:

  * Sending an email in response to a controller action

  * Communicating with third-party servers after an event is triggered

  * Offloading any slow work to make your app seem faster

## Advanced Web Application Testing

### Introduction to Cucumber {time="00:03:00"}

[Cucumber] []:

  * Is an English-like DSL for specification testing

  * Supports behavior-driven development (BDD)

  * Sits on top of your existing testing framework (RSpec, MiniTest,
    etc.)

  * Works with a variety of programming languages

### Using Cucumber to Test Our Application

Let's install Cucumber and test a new feature, one-hit wonders!

<div class="notes">

#### Outline of the Steps We'll Take {time="00:45:00"}

  #. Put the following two RubyGems into the `test` group in your
   `Gemfile` and `bundle install`:

    ~~~ {.ruby}
    group(:test) do
      gem('cucumber-rails', '1.4.1', require: false)
      gem('database_cleaner', '1.3.0')
    end
    ~~~

  #. Run the generator:

    ~~~
    rails generate cucumber:install
    ~~~

  #. Write your first feature.  Here's an example:

    ~~~
    Feature: One-hit Wonders
      In order to make users laugh
      Artists might be flagged as one-hit wonders

      Scenario: One-hit wonders have one album which sells more than all others
        Given an album that sold 2,000,000 copies
          And another album that sold 10 copies
         Then the artist is a one-hit wonder

      Scenario: Artists that have even sales aren't one-hit wonders
        Given an album that sold 20,000 copies
          And another album that sold 12,000 copies
         Then the artist is not a one-hit wonder
    ~~~

  #. At this point you would work with the stakeholder or domain
     expert and get these features approved.

  #. Write pending step definitions:

    ~~~ {.ruby}
    Before do
      @artist = FactoryGirl.build(:artist)
    end

    Given(/an(?:other)? album that sold ([\d,]+) copies/) do |copies|
      pending
    end

    Then(/the artist is a one-hit wonder/) do
      pending
    end

    Then(/the artist is not a one-hit wonder/) do
      pending
    end
    ~~~

  #. Before we can finish the step definitions we need to add another
     column to the albums table.  Create a new migration:

    ~~~
    rails g migration add_copies_sold_to_albums
    ~~~

  #. Edit the migration, and make it look something like this:

    ~~~ {.ruby}
    add_column(:albums, :copies_sold, :integer)
    ~~~

  #. Add an stubbed method to the artist model:

    ~~~ {.ruby}
    def one_hit_wonder?
      false
    end
    ~~~

  #. Fill out the step definitions:

    ~~~ {.ruby}
    before do
      @artist = FactoryGirl.build(:artist)
    end

    Given(/an(?:other)? album that sold ([\d,]+) copies/) do |copies|
      num = copies.gsub(',', '').to_i
      album = FactoryGirl.build(:album, artist: @artist, copies_sold: num)
      @artist.albums << album
    end

    Then(/the artist is a one-hit wonder/) do
      expect(@artist.one_hit_wonder?).to be true
    end

    Then(/the artist is not a one-hit wonder/) do
      expect(@artist.one_hit_wonder?).to be false
    end
    ~~~

  #. Fill out the `one_hit_wonder?` method:

    ~~~ {.ruby}
    def one_hit_wonder?
      copies = albums.map(&:copies_sold).compact
      return false if copies.size.zero?
      return true  if copies.size == 1 && copies.first > 10_000
      average = copies.sum / copies.size
      copies.one? {|n| n > average * 1.25}
    end
    ~~~

  #. Test your specifications:

    ~~~
    rake cucumber
    ~~~

</div>

### Introduction to Capybara {time="00:04:00"}

[Capybara] []:

  * Is a user-browser interaction testing tool

  * Provides a DSL for mechanically interacting with web pages

  * Can interact with real web browsers or use rendering libraries
    such as [WebKit] [] or [PhantomJS] []

~~~ {.ruby}
visit '/sessions/new'
within("#session") do
  fill_in 'Email', :with => 'user@example.com'
  fill_in 'Password', :with => 'password'
end
click_button 'Sign in'
expect(page).to have_content 'Success'
~~~

[webkit]: https://www.webkit.org/
[phantomjs]: http://phantomjs.org/

## Debugging Ruby on Rails Applications

### General Debugging Tips {time="00:05:00"}

Sometimes the simple things work the best:

  * Print something to the terminal:

    ~~~ {.ruby}
    $stderr.puts("WTF?")
    ~~~

  * Nearly everywhere in Rails you have access to a logging object:

    ~~~ {.ruby}
    logger.debug("HELP!")
    ~~~

    Other logger methods: `debug`, `info`, `warn`, `error`, and `fatal`

  * Raise an exception to see the error in the browser:

    ~~~ {.ruby}
    raise("Malfunction!")
    ~~~

### Interactive Debugging

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

<div class="notes">

#### Outline of the Steps We'll Take {time="00:15:00"}


  #. Add one of the gems to your `Gemfile` and `bundle install`:

    ~~~ {.ruby}
    group(:development, :test) do
      # Option 1.
      gem('ruby-debug', '0.10.4')

      # Option 2.
      gem('byebug', '3.5.1')
    end
    ~~~

  #. Open the comments controller and add insert the following line at
     the top of the `create` action:

    ~~~ {.ruby}
    debugger # If using ruby-debug
    byebug   # If using byebug
    ~~~

  #. Start the Rails server.

  #. Create a new comment in your browser, then return to the console
     (or your IDE if it supports debugging).  It should now be sitting
     at a debugger prompt.

  #. List debugger commands by entering `help`.  Here are some things
     to try:

    ~~~
    p @parents
    p params
    list
    ~~~

  #. Don't forget to remove the `debugger` or `byebug` line from your
    code!

</div>

### Tips When Debugging Ruby on Rails Applications {time="00:03:00"}

  * I've never found it useful to debug controllers

    - They shouldn't have much logic in them anyways
    - Just raise an exception if you're having trouble

  * I've found that using a proper debugger is really helpful when you
    can't figure out why a test is failing

    - Add `debugger` to the failing test
    - Run the test and it will drop down to a debugger prompt

## Scaling the Performance of Ruby on Rails

### It's All About Caching {time="00:03:00"}

The key to good performance in Rails is caching.  In other words,
don't perform an action if you don't have to.

### Caching Options and Configuration {time="00:05:00"}

  * By default, caching is only enabled in the `production`
    environment

  * Caching configuration options should be set in the
    `config/application.rb` file

  * The default caching store is in-process memory, which isn't very
    useful in production

  * Using a remote memory cache like `memcached` is very popular

### All Kinds of View and Controller Caching {time="00:03:00"}

  * Page caching (no longer part of Rails)

  * Action caching (no longer part of Rails)

  * Fragment caching

  * `ETag` and `Last-Modified` headers

### Playing with Fragment Caching {time="00:05:00"}

~~~ {.html}
<% cache([@artist, :comments]) do %>
  <h2>Comments</h2>

  <ul id="comments">
    <%= render(@artist.comments) %>
  </ul>

  <div id="new-comment"></div>
<% end %>
~~~

<div class="notes">

Noteworthy points:

  * The array given to the `cache` method makes up a unique cache key.

  * If the cache item for that key is missing, expired, or invalid
    then the block will execute and populate the cache.

  * Otherwise the existing cache value will be used.

  * Notice the use of "`<%`" and not "`<%=`" with the `cache` method.

  * Fragment caching can be nested.  If the outer cache is invalid the
    inner caches may still be valid and can speed up rendering.

</div>

### The `ETag` and `Last-Modified` Headers {time="00:05:00"}

  * For simple controller actions:

    ~~~ {.ruby}
    def show
      fresh_when(@artist)
    end
    ~~~

  * More complicated actions:

    ~~~ {.ruby}
    def show
      if stale?(@artist)
        respond_with(@artist)
      end
    end
    ~~~

<div class="notes">

Noteworthy points:

  * If you give a model object to `fresh_when` or `stale?` it will try
    to use the `cache_key` for that object as the `ETag` header and
    the `updated_at` as the `Last-Modified` header.

  * This is another really good reason to keep your time stamps in
    UTC.

</div>

### Direct Access to the Cache {time="00:10:00"}

You can also directly access the cache from anywhere in Rails:

~~~ {.ruby}
Rails.cache.fetch(:key) do
  # expensive computation
end
~~~

Several other cache methods are available, for example:

  * `Rails.cache.read`
  * `Rails.cache.write`

### Leveraging a Content Delivery Network (CDN) {time="00:03:00"}

Assets can be served from a CDN by setting:

~~~ {.ruby}
config.action_controller.asset_host =
  "http://cdn.com/..."
~~~

...in your production environment configuration file.  This works as
long as you use the helper methods for generating asset links such as:

~~~ {.ruby}
image_url("save_floppy")
~~~

### Don't Forget Background Queuing {time="00:03:00"}

If you can, offload expensive computations to a background queuing
server.

## Deploying Rails Applications to Production

### A Typical Production Environment {time="00:03:00"}

![](diagrams/ruby/rails/production-env.pdf)

<div class="notes">

Noteworthy points:

  * Typical web servers include Apache and nginx.

  * The Ruby HTTP layer can be something like Passenger or Unicorn.

  * A popular option for the cache is `memcached`.

</div>

### The Rails Web Application Stack {time="00:03:00"}

![](diagrams/ruby/rails/rails-stack.pdf)

<div class="notes">

Noteworthy points:

  * The Rails Middleware layer are custom Rack filters that prepare
    the request for the routing and controller layers.  It can be
    fully customized.

  * You can even add in your own middleware class if you want, which
    will get executed before routing or controllers.  You can even
    have it called *after* the controller layer.

</div>

### Production Environment Considerations {time="00:03:00"}

  * Your development environment should mirror the production
    environment as closely as possible (database vendor, version of
    Ruby, etc.)

  * Any RubyGems you are using on your machine should be in the
    `Gemfile` and your deployment system should install them in
    production.

  * Files with secure credentials like the database configuration or
    the `secrets.yml` file should be copied into place by your
    deployment system.

### Deploying Traditional Rails Applications {time="00:03:00"}

[Capistrano][] is the de facto standard for deploying Rails
applications into production.

  * Configuration is written in Ruby, using a DSL that is very similar
    to the one used in Rake

  * Can deploy anything to production, not just Ruby applications

  * Comes with a console where you can run shell commands on all
    machines at once

  * Easy to install, just put it in your `Gemfile` along with
    [capistrano-rails][]:

    ~~~ {.ruby}
    gem("capistrano")
    gem("capistrano-rails")
    ~~~

### Capistrano Configuration Overview {time="00:03:00"}

  * Initial configuration is created with the following command:

        cap install

  * Shared configuration goes into the `config/deploy.rb` file

  * Configuration files for each environment go into the
    `config/deploy` folder (e.g., `config/deploy/production.rb`)

### Servers and Roles in Capistrano {time="00:03:00"}

![](diagrams/ruby/rails/cap-servers.pdf)

<div class="notes">

Noteworthy points:

  * Servers and roles are configured in the Capistrano configuration
    files.

  * You're not stuck with the default roles that Capistrano uses, you
    can define them as needed.

  * The default "app" role is used to restart your Rails application
    after a deployment.  Servers in this role also receive new
    versions of your application during deployment.

  * The default "web" role is used if your web server needs to be
    restarted after a deployment.

  * The default "db" role is used when migrations need to be run.

</div>

### Common Capistrano Commands {time="00:03:00"}

  * Deploy application to production:

        cap production deploy

  * Revert to previous version:

        cap production deploy:rollback

  * Deploy and then run migrations:

        cap production deploy:migrate

## Security Considerations

### Configuration Files (Again) {time="00:03:00"}

I know I'm beating a dead horse here, but...

  * Don't store secrets in your application's source code

  * Don't store secrets in your source code control system

  * Secrets should only be available in production

### Keeping Secrets Out of the Log Files {time="00:05:00"}

You also need to keep sensitive information out of the Rails log file:

  * Rails and Devise keep passwords out of the log file

  * Additional URL parameters can be filtered by editing the following
    file:

    ~~~
    config/initializers/filter_parameter_logging.rb
    ~~~

  * Things you should filter include:

    - Credit card numbers, CVV numbers, etc.

    - Anything required by HIPAA, SOX, PCI, etc.

### Injection Attacks {time="00:03:00"}

An injection attack is anytime user-submitted data is used as if it
were trustworthy.  This often happens by mistake.

### SQL Injection Attacks {time="00:05:00"}

Happens when user-submitted data is used in SQL.  For example:

~~~ {.ruby}
 # THIS IS INSECURE AND WRONG!
 Artist.where("name = #{params[:name]}")
~~~

~~~ {.ruby}
 # Always use bind variables instead:
 Artist.where("name = ?", params[:name])
~~~

### Strong Parameters and Mass-assignment {time="00:05:00"}

  * Rails won't let you pass the raw `params` hash to model methods

  * You must first whitelist the parameters you want to allow

  * Pundit makes it easy to add authorization to this process

  * Example exploit: The GitHub mass-assignment
    [vulnerability of 2012] [github-exploit]

[github-exploit]: https://github.com/blog/1068-public-key-security-vulnerability-and-mitigation

### Cross-site Scripting (XSS) Attacks {time="00:05:00"}

![](diagrams/ruby/rails/xss.pdf)

<div class="notes">

Noteworthy points:

  * The malicious comment contains JavaScript which changes the HTML
    of the current page, inserting an image.

  * The image can be a 1x1 pixel, transparent GIF.

  * But the source URL for the image will contain secret information
    from the page, the browser store, cookies, the session, etc.

  * All of this can be prevented by ensuring user-submitted data isn't
    used without properly escaping it.  Rails does this by default.

</div>

### Cross-site Request Forgery (XSFR) Attacks {time="00:05:00"}

![](diagrams/ruby/rails/xsfr.pdf)

<div class="notes">

Noteworthy points:

  * The site in this example is vulnerable to XSS attacks.

  * The attacker arranges to have malicious content inserted on the
    vulnerable site.

  * When the victim, who has an active session with the target site,
    visits the vulnerable site, the attacker can use the victim's
    authority on the target site.

  * The first step in preventing these attacks is to ensure that an
    HTTP GET request *never* modifies data.

  * Then Rails steps in by ensuring that all other HTTP requests
    include a security token which is verified against a security
    token in the session.

  * This is what the `protect_from_forgery` method does in the
    application controller.

  * The attacker doesn't have to compromise a third-party site to get
    this to work.  An HTML email sent to the victim will often
    suffice.

</div>

### Session Fixation and Replay Attacks {time="00:05:00"}

![](diagrams/ruby/rails/fixation.pdf)

<div class="notes">

Noteworthy points:

  * In a session fixation attack the attacker arranges to have the
    victim use a known and valid session ID.  This isn't possible in
    Rails by default.

  * At some later point the victim logs into the target site with the
    compromise session ID.  The target site does not issue a new
    session ID so the attacker is now in possession of a valid and
    authenticated session ID.

  * Devise always issues new session IDs after authentication.

  * Session/cookie replay attack is when an attacker is able to see
    the HTTP traffic of the victim.

  * The attacker is therefore able to acquire a session cookie for the
    target site and assume the identity of the victim.  This is also
    called a session hijacking attack.

  * Always using SSL/TSL prevents the attacker from being able to see
    the HTTP traffic and therefore the session cookie.  (Unless the
    attacker is the NSA.)

</div>

### What's the Moral of the Story? {time="00:03:00"}

  * User-submitted data should never be trusted, or used without
    proper escaping.

  * Requests to your application, even with a valid session and
    originating from an authenticated client, might not be known to
    the owner of that client/browser.

  * Knowing the steps that Rails takes to protect against these types
    of attacks makes it less likely that you will introduce code which
    compromises its countermeasures.

## Maintaining Rails Applications

### Understanding Rails Version Numbers {time="00:03:00"}

![](diagrams/ruby/rails/rails-ver.pdf)

<div class="notes">

Noteworthy points:

  * Changes in the major numbers indicate significant feature changes
    which are most likely not backwards compatible with previous
    versions.

  * Changes in minor numbers indicate new features which may or may
    not be backwards compatible.  These version changes often
    deprecate features which will be removed in the next major
    release.

  * Changes in patch numbers indicate bug or security fixes and are
    fully backwards compatible.

</div>

### Minor- and Patch-version Upgrades {time="00:03:00"}

  * Relatively pain-free upgrades:

    #. Update the version number in your `Gemfile`
    #. `bundle install`
    #. Make sure all your tests pass

  * Always track patch-level version changes

  * Try your best to track minor-level version changes

  * After minor-level changes, watch the console and log files for
    deprecation warnings

### Introduction to Major Upgrades {time="00:03:00"}

  * Updates to the major number in Rails indicates a significant
    upgrade

  * You should begin by reading the release notes and upgrade guide

  * Sometimes there's an automated upgrade procedure

  * After updating the `Gemfile` and installing the latest version,
    you usually have to fix broken code from removed or changed
    features

  * Always make sure your tests pass; don't upgrade without a good
    test suite

# Resources and Recommendations

A helpful collection of tips and links to help you after the course.

## Ruby Key Points to Remember {time="00:00:00"}

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

## Ruby Information and Documentation

  * [The Ruby Programming Language][ruby-book]

  * [Effective Ruby][]

  * [Ruby online documentation][ruby-doc]

  * [Main repository of RubyGems][gems]

  * [Official Ruby webpage][mri]

## Ways to Practice Ruby

  * [Exercism.io][]

  * [Ruby Koans][]

  * [Codementor][]

## Rails Key Points to Remember {time="00:00:00"}

  * Don't override model and controller methods by accident, remember
    that Rails adds a ton of methods to your classes and know what
    they are.

  * Properly deal with exceptions in your Rails applications so you
    can report the correct error to your users.

  * Avoid "fat" classes, especially models and controllers.  Avoid the
    temptation to add too many methods to these classes.  Instead,
    create class libraries in the `lib` directory.

  * Views should be as simple as they possibly can be.  They should
    not contain business logic (that belongs in your models and class
    libraries) and should not contain authorization details (put those
    in Pundit policy classes).

  * Be very careful with what you do in database migrations.  It's
    very hard to maintain migrations over time.  Keep them simple,
    repeatable, and reversible.

  * Always escape user input before using it.  In Rails this means
    thinking carefully about using the `raw` view helper, and always
    using query bind variables instead of string interpolation.

  * Avoid using the session hash if possible.  If you're using the
    cookie store you only have 4k to work with.  Storing object in the
    session also means you might run into deserialization errors.

  * Keep your development and production environments in sync.  This
    means database vendors and versions, tools, RubyGems, etc.

  * Track all minor- and patch-level changes to Ruby on Rails.
    Keeping up with patch-level changes is a must for security.
    Tracking minor-level changes will help prepare you for major
    upgrades.

## Rails Information and Documentation

  * [The Rails 4 Way][rails way]

  * [Official Ruby on Rails website][rails home]

  * [Ruby on Rails API documentation][rails api]

  * [Rails Guides][]

  * Install Rails on Windows with the [Rails Installer][]

## RubyGems for Rails Development

  * [Devise][]: Authentication

  * [Pundit][]: Authorization

  * [Capistrano][]: Deployment

  * [RSpec][]: Spec testing

  * [Cucumber][]: Better spec testing

  * [Capybara][]: Integration/browser testing

  * [FactoryGirl][factory_girl]: Test object factories

  * [Mocha][]: Test object mocking and stubbing

  * [SASS][]: CSS superset
