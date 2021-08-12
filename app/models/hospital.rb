class Hospital < ApplicationRecord
  has_many :healthinterviews
  has_many :staffs
  has_many :hospital_labelings

  mount_uploader :image, ImageUploader
end
