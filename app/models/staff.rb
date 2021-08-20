class Staff < ApplicationRecord
  belongs_to  :hospital
  # has_many :guide_labels

  validates :name,     presence: true, length: { in: 1..20, allow_blank: true }
  validates :encrypted_password, on: :create, presence: true
  #                                 format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,20}\z/ }

  devise :database_authenticatable, :validatable, :lockable,
   :timeoutable, :trackable, :authentication_keys => [:name]

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
