class MP3Importer
    # The MP3Importer class will parse all the filenames in the spec/fixtures folder and send the filenames to the Song class
    attr_accessor :path

    def initialize(path) # path attribute gets set on initialization
        @path = path
    end

    def files
        # loads all the mp3 files in the path directory using Dir.glob
        # normalizes the filename to just the mp3 filename with no path
        # use .collect to applies the given block of code on all the items and returns the new array
        # use .gsub to replace path with "" (remove characters by making second argument an empty string)
       directories = Dir.glob("#{path}/*mp3").collect { |file| file.gsub("#{path}/", "") }
    end

    def import
        files.each do |file| 
            Song.new_by_filename(file)
        # imports the files into the library by creating songs from a filename
        # iterate through all the files 
        #add song by filename 
        end
    end 
end 