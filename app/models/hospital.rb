class Hospital < ApplicationRecord
  has_many :health_interviews, dependent: :destroy
  has_many :staffs, dependent: :destroy
  has_many :hospital_labelings, dependent: :destroy
  has_many :hospital_labels, through: :hospital_labelings
  has_many :favorite_hospitals, dependent: :destroy
  # has_many :favorite_patients, through: :favorite_hospitals, source: :patient

  geocoded_by :address

  validates :name,         presence: true, length: { in: 2..50, allow_blank: true }
  validates :email,        presence: true, length: { maximum: 255 } # , uniqueness: true
  validates :tel,          presence: true, numericality: { only_integer: true, allow_blank: true }# , uniqueness: true
  validates :address,      presence: true, length: { maximum: 255 }
  validates :access,       presence: true

  # before_validation { email.downcase! }
  after_validation :geocode, if: :address_changed?
  # after_validation { case tel.size
  #   when 10; tel.gsub(/(\d{2})(\d{4})(\d{4})/, '\1_\2_\3')
  #   when 11; tel.gsub(/(\d{3})(\d{4})(\d{4})/, '\1_\2_\3')
  # end }

  mount_uploader :image, ImageUploader
end
