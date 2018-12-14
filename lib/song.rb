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
    song = self.new
    @@all << song
    # binding.pry
    song
  end

  def self.new_by_name(name)
    # binding.pry
    song = self.new
    song.name = name

    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    # binding.pry
    song
  end

  def self.find_by_name(song)
    @@all.find { |s| s.name == song }
  end

  def self.find_or_create_by_name(song)
    unless Song.find_by_name(song)
      Song.create_by_name(song)
    else
      Song.find_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by { |s| s.name }
  end

  def self.new_from_filename(song)
    full_song = song.split("-")
    song = self.new
    song.artist_name = full_song[0].strip
    song.name = full_song[1].gsub(".mp3","").strip
    @@all << song
    song
  end

  def self.create_from_filename(song)
    full_song = song.split("-")
    song = self.new
    song.artist_name = full_song[0].strip
    song.name = full_song[1].gsub(".mp3","").strip
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
