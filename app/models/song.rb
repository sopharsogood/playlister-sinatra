class Song < ActiveRecord::Base
    has_many :song_genres
    has_many :genres, through: :song_genres
    belongs_to :artist

    def slug
        Slugifiable.slugify(self.name)
    end

    def self.find_by_slug(slug)
        self.all.detect do |object|
            object.slug == slug
        end
    end
end