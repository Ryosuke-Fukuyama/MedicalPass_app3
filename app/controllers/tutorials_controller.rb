class TutorialsController < ApplicationController
  def index; end

  def guest_sign_in
    patient = Patient.find_or_create_by!(email: 'guest@example.com') do |patient|
      patient.name = 'ゲスト'
      patient.password = SecureRandom.hex(4)
      patient.confirmed_at = Time.now
    end
    sign_in patient
    redirect_to patient_path, notice: t('notice.guest_patient')
  end

  # def guest_admin_sign_in
  #   staff = Staff.find_or_create_by!(name: 'ゲスト管理者') do |staff|
  #     staff.admin = true
  #     staff.password = SecureRandom.urlsafe_base64
  #   end
  #   sign_in staff
  #   redirect_to root_path, notice: 'ゲスト管理者としてログインしました。'
  # end
end
