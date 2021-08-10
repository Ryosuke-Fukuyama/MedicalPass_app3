class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def admin_required
  #   redirect_to health_interviews_path unless staff_signed_in? && current_staff.admin?
  # end

  # def staff_required
  #   redirect_to health_interviews_path unless staff_signed_in?
  # end

  def patient_required
    redirect_to health_interviews_path unless patient_signed_in?
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
