require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create 
    song = self.new       #instantiates a song
    song.save             #saves the song
    song
  end
  
  def self.new_by_name(name)
    song = self.new       #instantiates a song
    song.name = name      #name property is applied
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
    
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)    #if find_by_name returns true it stays left, else right
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name}   #remember .name is an attr_accessor
  end
  
  def self.new_from_filename(filename)
    if filename.include?(".mp3")
      filename.each do |song|
        split_song_artist = [ ]
        split_up = song.split(" - ")
        split_song_artist << split_up
        new_song = split_song_artist[0].create_by_name
      end
      new_song
    end
      
  end
  
end
