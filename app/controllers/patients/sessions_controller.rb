# frozen_string_literal: true

class Patients::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :verify_authenticity_token, only: :create

  protected

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: %i[login name email password remember_me])
    end

    def after_sign_in_path_for(resource)
      patient_path(resource)
    end

    def after_sign_out_path_for(_resource)
      new_patient_session_path
    end
end
