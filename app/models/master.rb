class Master < ApplicationRecord
  devise :database_authenticatable, :validatable, :trackable,
         authentication_keys: [:password]

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
