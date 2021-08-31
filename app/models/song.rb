class Song < ActiveRecord::Base
    has_many :genre_songs
    has_many :genres, through: :genre_songs
    belongs_to :artist
end