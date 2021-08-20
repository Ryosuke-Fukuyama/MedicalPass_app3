class Staff < ApplicationRecord
  belongs_to  :hospital
  # has_many :guide_labels

  validates :name,     presence: true, length: { in: 1..20, allow_blank: true }
  validates :encrypted_password, on: :create, presence: true
  #                                 format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,20}\z/ }

  devise :database_authenticatable, :registerable,
         :validatable, :lockable, :timeoutable, :trackable

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def update_without_password(params, *options)
    # current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    # result = if valid_password?(current_password)
    #   update_attributes(params, *options)
    # else
    #   self.assign_attributes(params, *options)
    #   self.valid?
    #   self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
    #   false
    # end

    update_attributes(params, *options)

    clean_up_passwords
    result
  end
end
