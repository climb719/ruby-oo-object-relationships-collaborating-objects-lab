class Artist
    # The Artist class will be responsible for either creating the artist (if the artist doesn't exist in our program yet) or finding the instance of that artist (if the artist does exist).
    attr_accessor :name, :songs #sets artist name 
    @@all = []

    def initialize(name) #initialized with a name 
        @name = name
        @@all << self 
    end

    def self.all
        @@all
    end

    def add_song(song) # method exists to tell a passed in Song instance it belongs to this Artist instance
        song.artist = self 
    end 

    def songs #get all existing Song instances from Song and select only the ones that are associated with this Artist instance
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        # create a new variable and set it equal to the result of .find
        # iterate through all array go through each element of the array one by one and store each artist element 
        # for each artist check if name is equal to one passed 
        # in and if true will return atrtist or move on to next 
      artist_name = @@all.find { |artist| artist.name == name } 
      if artist_name # if artist_name found 
         artist_name  # return it 
      else 
        artist_name = Artist.new(name) # if not found/returns nil, set it equal to an instance of a new artist 
        artist_name
      end
    end

    def print_songs
        # self is instance of an artist
        self.songs.each do |song| # iterate through that artist's (one instance) songs
            puts song.name #print the song name 
        end
    end

end

