class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable , :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]
        #  :trackable

  # has_many :health_interviews, dependent: :destroy

  validates :name,     presence: true, length: { in: 2..20, allow_blank: true }
  validates :email,    presence: true, length: {maximum: 255},
                       uniqueness: true
  validates :encrypted_password,
            :password,
            :password_confirmation, presence: true,
                                    format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,20}\z/ }, on: :create
  validates :tel,      format: { with: /\A\d{10,11}\z/ }, uniqueness: true
  validates :address,  length: {maximum: 255}

  before_validation { email.downcase! }

  def will_save_change_to_email?
    true
  end
end
