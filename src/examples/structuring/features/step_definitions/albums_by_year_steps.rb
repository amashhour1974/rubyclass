require_relative('../../discography')
Discography = Structuring::Discography

def data_path(file)
  File.expand_path("../../../data/#{file}", File.dirname(__FILE__))
end

# <<: given
# Gherkin:
#
#   Given the file "artists.yml"
Given("the file {string}") do |file|
  @library = Discography::Library.open(data_path(file))
  @artist  = @library.artists.first
end
# :>>

# <<: when
# Gherkin:
#
#   When I select albums from 2001
When("I select albums from {int}") do |year|
  @albums = @artist.albums(year)
end
# :>>

# <<: then
# Gherkin:
#
#   Then there should be 1 returned album
Then("there should be {int} returned album(s)") do |count|
  expect(@albums.size).to(be(count))
end
# :>>
