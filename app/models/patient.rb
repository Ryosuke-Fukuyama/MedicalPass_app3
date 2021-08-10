class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]
        #  :timeoutable, :trackable

  has_many :health_interviews, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy

  validates :name,     presence: true, length: { in: 2..20, allow_blank: true }
  validates :email,    presence: true, length: { maximum: 255 },
                       uniqueness: true
  validates :encrypted_password,
            :password,
            :password_confirmation, presence: true,
                                    format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,20}\z/ }, on: :create
  validates :tel,      format: { with: /\A\d{10,11}\z/ }, uniqueness: true
  validates :address,  length: { maximum: 255 }

  before_validation { email.downcase! }

  def will_save_change_to_email?
    true
  end

  def self.from_omniauth(auth)
    where(provider: auth.sns_credentials.provider, uid: auth.sns_credentials.uid).first_or_create do |patient|
      patient.name = auth.info.name
      patient.email = auth.info.email
      patient.password = Devise.friendly_token[0, 20]
    end
  end
end
