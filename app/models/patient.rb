class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :confirmable, # :authentication_keys => [:login],
         :omniauthable, omniauth_providers: [:google_oauth2]
        #  :timeoutable, :trackable

  has_many :health_interviews, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy

  validates :name,     presence: true, length: { in: 2..20, allow_blank: true }
  validates :email,    presence: true, length: { maximum: 255 },
                       uniqueness: true
  validates :encrypted_password, on: :create, presence: true
  #                                 format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,20}\z/ }
  validates :tel,      uniqueness: true, allow_nil: true
                      #  format: { with: /\A\d{10,11}\z/ }
  validates :address,  length: { maximum: 255 }

  before_validation { email.downcase! }

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(['name = :value OR lower(email) = lower(:value)', { value: login }]).first
    else
      where(conditions).first
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.sns_credentials.provider, uid: auth.sns_credentials.uid).first_or_create do |patient|
      patient.name = auth.info.name
      patient.email = auth.info.email
      patient.password = Devise.friendly_token[0, 20]
    end
  end
end
