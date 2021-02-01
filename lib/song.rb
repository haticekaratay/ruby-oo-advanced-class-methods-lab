require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
      song = self.new
      song.save
      @@all << song
      song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end
    

  def self.all

    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  #binding.pry
  def self.new_from_filename(file)   #file = "Taylor Swift - Blank Space.mp3"
    file_info = File.basename(file,".mp3")  # this will set file_inof to Taylor Swift - Blank Space
    file_info_array =file_info.split(" - ")
    artist_name = file_info_array[0] 
    song_name = file_info_array[1] 
    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(file)
    file_info = File.basename(file,".mp3")  # this will set file_inof to Taylor Swift - Blank Space  File.basename(path, ".*") also would work
    file_info_array =file_info.split(" - ")
    artist_name = file_info_array[0] 
    song_name = file_info_array[1] 
    song = self.new
    song.save
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
