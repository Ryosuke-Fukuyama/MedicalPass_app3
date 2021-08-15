class Patient < ApplicationRecord
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

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :confirmable, # :authentication_keys => [:login],
         :omniauthable, omniauth_providers: [:google_oauth2]
  #  :timeoutable, :trackable

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(['name = :value OR lower(email) = lower(:value)', { value: login }]).first
    else
      where(conditions).first
    end
  end

  # def self.find_for_google(auth)
  #   patient = Patient.find_by(email: auth.info.email)

  #   unless patient
  #     patient = Patient.create(
  #       name:     auth.info.name,
  #       email:    auth.info.email,
  #       provider: auth.provider,
  #       uid:      auth.uid,
  #     #  token:    auth.credentials.token,
  #      password: Devise.friendly_token[0, 20],
  #      meta:     auth.to_yaml
  #     )
  #   end
  #   patient
  # end

  def self.without_sns_data(auth)
    patient = Patient.where(email: auth.info.email).first

    if patient.present?
      sns = SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        patient_id: patient.id
      )
    else
      patient = Patient.new(
        name: auth.info.name,
        email: auth.info.email
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
    { patient: patient, sns: sns }
  end

  def self.with_sns_data(auth, snscredential)
    patient = Patient.where(id: snscredential.patient_id).first
    unless patient.present?
      patient = Patient.new(
        name: auth.info.name,
        email: auth.info.email
      )
    end
    { patient: patient }
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      patient = with_sns_data(auth, snscredential)[:patient]
      sns = snscredential
    else
      patient = without_sns_data(auth)[:patient]
      sns = without_sns_data(auth)[:sns]
    end
    { patient: patient, sns: sns }
  end
end
