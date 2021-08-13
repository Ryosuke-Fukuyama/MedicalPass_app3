class TutorialsController < ApplicationController
  def index; end

  def guest_sign_in
    patient = Patient.find_or_create_by!(email: 'guest@example.com') do |patient|
      patient.name = 'ゲスト'
      patient.password = SecureRandom.hex(4)
      patient.confirmed_at = Time.now
    end
    sign_in patient
    redirect_to patient_path(current_patient.id), notice: t('notice.guest_patient')
  end

  def guest_staff_sign_in
    staff = Staff.find_or_create_by!(name: 'ゲストスタッフ') do |staff|
      staff.password = SecureRandom.hex(4)
      staff.hospital_id = 1
    end
    sign_in staff
    redirect_to hospital_health_interviews_path[hospital_id: 1], notice: t('notice.guest_admin_staff')
  end

  def guest_admin_sign_in
    staff = Staff.find_or_create_by!(name: 'ゲストアドミン') do |staff|
      staff.admin = true
      staff.password = SecureRandom.hex(4)
      staff.hospital_id = 1
    end
    sign_in staff
    redirect_to hospital_health_interviews_path[hospital_id: 1], notice: t('notice.guest_admin_staff')
  end
end
