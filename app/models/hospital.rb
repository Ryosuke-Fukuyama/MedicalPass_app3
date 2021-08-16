class Hospital < ApplicationRecord
  has_many :healthinterviews, dependent: :destroy
  has_many :staffs, dependent: :destroy
  has_many :hospital_labelings, dependent: :destroy
  has_many :hospital_labels, through: :hospital_labelings
  has_many :favorite_hospitals, through: :favorites, source: :patient, dependent: :destroy

  geocoded_by :address

  validates :name,         presence: true, length: { in: 2..20, allow_blank: true }
  validates :email,        presence: true, uniqueness: true, length: { maximum: 255 }
  validates :tel,          presence: true, uniqueness: true, numericality: { only_integer: true }, allow_blank: true
  validates :address,      presence: true
  validates :access,       presence: true

  before_validation { email.downcase! }
  after_validation :geocode, if: :address_changed?

  mount_uploader :image, ImageUploader
end
