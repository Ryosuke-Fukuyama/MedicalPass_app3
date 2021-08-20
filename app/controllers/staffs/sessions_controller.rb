# frozen_string_literal: true

class Staffs::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :verify_authenticity_token, only: :create

  protected

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end

    def after_sign_in_path_for(resource)
      hospital_id = (resource)[:hospital_id]
      hospital_health_interviews_path(hospital_id)
    end

    def after_sign_out_path_for(_resource)
      new_staff_session_path
    end
end
