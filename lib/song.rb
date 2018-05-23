require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create
  song = self.new
  song.save
  end

  def self.new_by_name(name)
  song = self.new
  song.name = name
  song
  end

  def self.create_by_name(name)
  song = self.new
  song.name = name
  song.save
  end

  def self.find_by_name(name)
    all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  new_song = Song.find_by_name(name)
    if new_song == nil
    Song.create_by_name(name)
    else
    new_song
    end
  end

  def self.alphabetical
    all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
  artist, song = filename.split(" - ")
  song = song.split(".")[0]
  new_song = self.new_by_name(song)
  new_song.artist_name = artist
  new_song.save
  end

  def self.create_from_filename(filename)
  artist, song = filename.split(" - ")
  song = song.split(".")[0]
  new_song = self.create_by_name(song)
  new_song.artist_name = artist
  new_song.save
  end

  def self.destroy_all
    self.all.clear
  end
  #end
end
