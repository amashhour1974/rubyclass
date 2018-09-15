################################################################################
require('yaml')

################################################################################
module Structuring

############################################################################
  module Discography

    ##########################################################################
    # <<: album
    class Album
      attr_accessor(:name, :year)

      def initialize(name, year)
        self.name = name
        self.year = year
      end
    end
    # :>>

    ##########################################################################
    # <<: artist
    class Artist
      attr_accessor(:name)

      def initialize(name, albums)
        self.name = name
        @albums   = albums
      end

      def albums(year)
        @albums.select {|a| a.year == year}
      end
    end
    # :>>

    ##########################################################################
    class Library
      attr_reader(:artists)

      # <<: library-open
      def self.open(file_name)
        data = YAML.load_file(file_name)

        artists = data.map do |raw_artist|
          albums = raw_artist["albums"].map do |raw_album|
            Album.new(raw_album["name"], raw_album["year"])
          end

          Artist.new(raw_artist["name"], albums)
        end

        new(artists)
      end
      # :>>

      def initialize(artists)
        @artists = artists
      end
    end
  end
end
