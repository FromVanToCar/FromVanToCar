class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :agreements

  mount_uploader :photo, PhotoUploader
end
