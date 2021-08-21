# frozen_string_literal: true

class Masters::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:password])
  end

  def after_sign_in_path_for
    new_hospital_path
  end

  def after_sign_out_path_for(_resource)
    hospitals_path
  end
end
