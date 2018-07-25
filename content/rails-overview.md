# Welcome to Ruby on Rails

## What is Ruby on Rails?

### Libraries, Frameworks, and Code

  * A *library* of code for writing web applications

  * A *framework* for structuring web applications

  * Open Source Software, free to use and modify

  * Maintained by volunteers and paid engineers

  * Supervised by a small core team of developers

### Ruby What?  Rails What?

  * *Ruby* is a popular programming language

  * *Ruby on Rails* is a library that is written in Ruby

  * Ruby on Rails is often shortened to *Rails*

  * We'll look at both Ruby and Rails

## The World of Web Applications

### Web Application Components

![](diagrams/ruby/rails/components.pdf)

### What Rails Brings to the Table

  * A solution to all the common web application components

  * Allows you to focus on your business logic

  * Everything else is part of a well tested, heavily used framework

# Ruby: The Programming Language

## History and Background Information

### Brief History of Ruby

   * First released in 1995 by Japanese programmer Yukihiro "Matz" Matsumoto

   * Major U.S. adoption with v1.8 (2003)

   * Modern Ruby began with v1.9 (2007)

   * The current version is 2.2 (2014)

### Design Goals and Constraints

  * Optimized for developer performance (vs. execution performance)

  * The interpreter needs access to the source code

  * General purpose language (not just for web applications)

  * Garbage collected

## Who Maintains It?

  * A large collection of volunteers

  * Heroku (Salesforce.com) employs Matz

  * Several full-time engineers in the U.S.

  * A core team of maintainers in Japan

# Rails: The Framework

## History and Background Information

### The Origins of Ruby on Rails

  * David Heinemeier Hansson (DHH) released Rails in 2004

  * It was extracted from a web application called Basecamp

### Version History

  * 1.0 released in 2005

  * 3.0 begins the modern era of Rails (2010)

  * 4.2 is the current version (2014)

  * 5.0 is in the works

## Who Maintains It?

  * A small core team of developers

  * Thousands of volunteer software engineers

  * A handful of paid, full-time engineers

## Who's Using It?

  * Basecamp (and basically all 37 signals products)

  * Github (popular source code hosting platform)

  * Shopify (small business merchant sites)

  * Groupon (local marketing via special discounts)

  * Hulu (video streaming service)

  * And a lot more...

## Why Use Ruby on Rails

### Convention Over Configuration

  * Very little configuration needed

  * No need to glue components together

  * Yet still easy to swap components out

### Strong Focus on Testing

  * Since Ruby is a dynamic language, testing is very important

  * Rails makes it easy to write automated tests

<!-- ## Where Rails Fits In -->

<!-- How it fits into your existing company -->

## What Does It Look Like?

### How Rails Fits into the Network Stack

![](diagrams/ruby/rails/browser-server.pdf)\

<!-- Remove figure from above. -->

## The Major Components

### Introduction to Model-view-controller

  * Rails uses the MVC design pattern

  * Successful way to build graphical applications (circa 1970)

  * Separates application logic into three major sections

### The Model

  * Business data and logic

  * Data persisted in a relational database

  * Contains no user interface code

  * Usable by any user interface necessary

### The View

  * The user interface

  * Display models to the user (HTML)

  * No business logic allowed in the view

  * Models are essentially read-only to the view

  * Multiple views can be used to show the same model in different ways

### The Controller

  * Bridge between the user interface (view) and data (model)

  * Fetches the appropriate data for the current view

  * Translate commands from the user into actions on the data

### Databases and Adapters

  * Unified interface for all supported databases (a lot)

  * Keeps applications portable to other databases

  * Allows direct access to database if needed

### Database Schema Migrations

  * Manage the database schema like we do with source code

  * Automate production schema changes

  * Go back in time when necessary

# Ruby on Rails and Security

## Attack Countermeasures

### Secure By Default

  * Most programmers are not security experts

  * Rails has sensible and secure defaults

  * Contains countermeasures out of the box

  * The most common use cases are safe

### Injection Attacks

  * Injection attacks happen when user input is trusted

  * Example: User input is directly embedded in database queries

  * Worst Case: User input is treated as executable code

### Cross-site Scripting (XSS) Attacks {time="00:05:00"}

![](diagrams/ruby/rails/xss.pdf)\

<!-- Remove figure caption from above -->

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

![](diagrams/ruby/rails/xsfr.pdf)\

<!-- Remove figure caption from above -->

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

![](diagrams/ruby/rails/fixation.pdf)\

<!-- Remove figure caption from above -->

<div class="notes">

Noteworthy points:

  * In a session fixation attack the attacker arranges to have the
    victim use a known and valid session ID.  This isn't possible in
    Rails by default.

  * At some later point the victim logs into the target site with the
    compromise session ID.  The target site does not issue a new


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
