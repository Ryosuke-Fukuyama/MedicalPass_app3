class Hospital < ApplicationRecord
  has_many :healthinterviews
  has_many :staffs
  has_many :hospital_labelings

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  mount_uploader :image, ImageUploader
end
