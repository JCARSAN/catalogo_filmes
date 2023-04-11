class Director < ApplicationRecord
  belongs_to :genre
  validates :name, presence: true
  mount_uploader :photo, PhotoUploader
end
