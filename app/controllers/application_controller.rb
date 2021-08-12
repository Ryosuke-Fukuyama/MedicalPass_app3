class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def admin_required
    redirect_to hospital_health_interviews_path unless staff_signed_in? && current_staff.admin? && current_staff.hospital_id == hospital_id
  end

  def staff_required
    redirect_to hospital_health_interviews_path unless staff_signed_in? && current_staff.hospital_id == hospital_id
  end

  def patient_required
    redirect_to hospital_health_interviews_path unless patient_signed_in?
  end
end
