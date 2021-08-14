class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
    before_action :set_hospital

    helper_method :admin_required

  def admin_required
    redirect_back fallback_location: { action: "index" } unless staff_signed_in? && current_staff.admin? && current_staff.hospital_id == @hospital.id
  end

  def staff_required
    redirect_back fallback_location: { action: "index" } unless staff_signed_in? && current_staff.hospital_id == @hospital.id
  end

  def patient_required
    redirect_back fallback_location: { action: "index" } unless patient_signed_in?
  end

  private

  def set_hospital
    @hospital = Hospital.find(current_staff.hospital_id) if staff_signed_in?
  end
end
