class Movie < ActiveRecord::Base
  include FilterByAttributes

  validates :video_id, presence: true, uniqueness: true

  def self.create_by_video_id(movie_id)
    movie_infomation = Niconico::Client.new(movie_id).movie.try(:to_hash)
    return nil unless movie_infomation

    create!(filter_by_attributes(movie_infomation))
  end
end
