class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def admin_required
    redirect_back fallback_location: { action: "index" } unless staff_signed_in? && current_staff.admin? && current_staff.hospital_id == hospital_id
  end

  def staff_required
    redirect_back fallback_location: { action: "index" } unless staff_signed_in? && current_staff.hospital_id == @hospital.id
  end

  def patient_required
    redirect_back fallback_location: { action: "index" } unless patient_signed_in?
  end
end
