class Song < ActiveRecord::Base
  # add associations here
  require 'pry'
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist.nil?
      return nil
    else
      self.artist.name
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.strip.empty?
        self.notes.new(content: note)
      end
    end
  end

  def note_contents
    ar = []
    self.notes.each do |note|
      ar << note.content
    end
    ar
  end
end
