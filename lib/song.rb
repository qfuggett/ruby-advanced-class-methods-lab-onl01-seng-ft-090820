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
    @@all.detect(name)
    
  end
  
  
end
