# frozen_string_literal: true

class Patients::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation remember_me])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password password_confirmation current_password])
    end

    def after_sign_up_path_for(resource)
      super(resource)
    end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

    # password = Devise.friendly_token.first(7)
    # if session[:provider].present? && session[:uid].present?
    #   @patient = Patient.create(
    #     name:session[:name],
    #     email: session[:email],
    #     password: "password",
    #     password_confirmation: "password",
    #     # confirmed_at: "Time.now"
    #   )
    #   sns = SnsCredential.create(
    #     patient_id: @patient.id,
    #     uid: session[:uid],
    #     provider: session[:provider]
    #   )
    # else
    #   @patient = Patient.create(
    #     name:session[:name],
    #     email: session[:email],
    #     password: session[:password],
    #     password_confirmation: session[:password_confirmation],
    #   )
    # end

    def check_captcha
      unless verify_recaptcha(message: 'reCAPTCHAのチェックをしてください')
        self.resource = resource_class.new sign_up_params
        resource.validate
        set_minimum_password_length
        respond_with_navigational(resource) { render :new }
      end
    end
end
