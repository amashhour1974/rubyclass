################################################################################
require('minitest/autorun')
require('yaml')
require_relative('discography')

################################################################################
module Structuring

  ##############################################################################
  class DiscographyTest < MiniTest::Test

    ############################################################################
    # <<: constant
    TEST_ALBUMS = [
      Discography::Album.new("The Knife",            2001),
      Discography::Album.new("Deep Cuts",            2003),
      Discography::Album.new("Silent Shout",         2006),
      Discography::Album.new("Shaking the Habitual", 2013),
    ]
    # :>>

    ############################################################################
    # <<: test
    def test_artist
      artist = Discography::Artist.new("The Knife",
                                       TEST_ALBUMS)

      albums = artist.albums(2003)
      assert_equal(1, albums.size)
      assert_equal("Deep Cuts", albums.first.name)
    end
    # :>>

    ############################################################################
    def test_library_loading
      file = File.expand_path("../data/artists.yml", File.dirname(__FILE__))
      library = Discography::Library.open(file)
      refute_empty(library.artists)
      assert_kind_of(Array, library.artists)
      library.artists.each do |artist|
        assert_kind_of(Discography::Artist, artist)
        refute_empty(artist.albums(2001))
        artist.albums(2001).each {|a| assert_kind_of(Discography::Album, a)}
      end
    end
  end

  ##############################################################################
  module FromHash

    ############################################################################
    module Discography

      ##########################################################################
      class Album < Structuring::Discography::Album
        # <<: album-from-hash
        def self.from_hash(raw)
          new(raw["name"], raw["year"])
        end
        # :>>
      end

      ##########################################################################
      class Artist < Structuring::Discography::Artist
        # <<: artist-from-hash
        def self.from_hash(raw)
          albums = raw["albums"].map {|a| Album.from_hash(a)}
          new(raw["name"], albums)
        end
        # :>>
      end

      ##########################################################################
      class Library < Structuring::Discography::Library
        # <<: library-open2
        def self.open(file_name)
          data = YAML.load_file(file_name)
          artists = data.map {|raw| Artist.from_hash(raw)}
          new(artists)
        end
        # :>>
      end
    end
  end

  ##############################################################################
  class Discography2Test < MiniTest::Test

    ############################################################################
    def test_artist_from_hash
      raw = {
        "name" => "The Knife",
        "albums" => [
          { "name" => "foo",
            "year" => 1999,
          }
        ]
      }

      artist = FromHash::Discography::Artist.from_hash(raw)
      assert_equal("The Knife", artist.name)
      refute_empty(artist.albums(1999))
    end

    ############################################################################
    def test_library_loading
      file = File.expand_path("../data/artists.yml", File.dirname(__FILE__))
      library = FromHash::Discography::Library.open(file)
      refute_empty(library.artists)
      assert_kind_of(Array, library.artists)
      library.artists.each do |artist|
        assert_kind_of(FromHash::Discography::Artist, artist)
        refute_empty(artist.albums(2001))
        artist.albums(2001).each {|a| assert_kind_of(FromHash::Discography::Album, a)}
      end
    end
  end

  ##############################################################################
  module Sorting

    ############################################################################
    module Discography

      ##########################################################################
      class Artist < Structuring::Discography::Artist
        # <<: artist-sort-name
        def sort_name
          name.sub(/^(?:The|An?)\s/, '')
        end
        # :>>
      end
    end
  end

  ##############################################################################
  class SortingTest < MiniTest::Test

    ############################################################################
    def test_sorting_works
      a1 = Sorting::Discography::Artist.new("The Knife", [])
      a2 = Sorting::Discography::Artist.new("An Emergency", [])
      a3 = Sorting::Discography::Artist.new("A Tribe Called Quest", [])

      assert_equal("Knife", a1.sort_name)
      assert_equal("Emergency", a2.sort_name)
      assert_equal("Tribe Called Quest", a3.sort_name)

      sorted = [a1, a2, a3].sort_by {|a| a.sort_name}
      assert_equal([a2, a1, a3], sorted)
    end
  end
end
