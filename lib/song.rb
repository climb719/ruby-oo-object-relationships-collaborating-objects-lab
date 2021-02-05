class Song
    # The Song class will be responsible for creating songs given each filename and sending the artist's name (a string) to the Artist class
    attr_accessor :name, :artist
    @@all = []
  
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename) #pass in a filename 
        new_song = filename.split(" - ") # parse a filename to find the song name and artist name
        song = self.new(new_song[1])  # create a new song instance using the string we gathered from the filename
        song.artist=(Artist.new(new_song[0])) #associate that new song with an artist. Use the artist attribute accessor to assign this
        song  # return the new song instance
    end

    def artist_name=(name) # accepts an artist's name
        self.artist = Artist.find_or_create_by_name(name) #finds or creates an Artist instance 
        artist.add_song(self) #assigns it to the Song's artist attribute 
    end

end 