# This is a comment
# <<: feature
Feature: Select Albums by Year
  As a music lover
  I want to select albums by year
  So I can explore an artist better

  Scenario: A data file exists with album entries
    Given the file "artists.yml"
    When I select albums from 2001
    Then there should be 1 returned album
# :>>

# <<: variables
  Scenario Outline: Checking various years of albums
    Given the file "artists.yml"
    When I select albums from <year>
    Then there should be <count> returned album

  Examples:
    | year | count |
    | 2001 | 1     |
    | 2003 | 1     |
    | 2006 | 1     |
    | 2013 | 1     |
# :>>
