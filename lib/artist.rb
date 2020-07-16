class Artist

    attr_accessor :name, :genre
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    #given a name and genre creates a new song associated with that artist
    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    #returns all songs associated with this artist
    def songs
        Song.all.select do |song|
            song.artist == self
          end
    end

    #has many genres through songs
    def genres
        Song.all.map do |song|
            song.artist == self
            song.genre
          end
    end

end 