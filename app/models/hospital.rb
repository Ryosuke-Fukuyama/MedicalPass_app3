class Hospital < ApplicationRecord
  has_many :healthinterviews, dependent: :destroy
  has_many :staffs, dependent: :destroy
  has_many :hospital_labelings, dependent: :destroy
  has_many :hospital_labels, through: :hospital_labelings
  has_many :favorite_hospitals, through: :favorites, source: :patient, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  mount_uploader :image, ImageUploader
end
