class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :validatable,:lockable, :timeoutable, :trackable

  validates :name,     presence: true, length: { in: 2..20, allow_blank: true }
  validates :encrypted_password,
            :password,
            :password_confirmation, on: :create, on: :update, presence: true
  #                                 format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,20}\z/ }


  # def email_required?
  #   false
  # end

  # def will_save_change_to_email?
  #   false
  # end
end
