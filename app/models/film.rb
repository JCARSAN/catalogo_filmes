class Film < ApplicationRecord
  enum status:{ draft:0, published:1 }
  belongs_to :director
  belongs_to :genre
  validates :title, :year_published, :synopsis, :country, :duration, :director_id, :genre_id, :released, presence:true
  mount_uploader :poster_photo, PosterUploader
end
