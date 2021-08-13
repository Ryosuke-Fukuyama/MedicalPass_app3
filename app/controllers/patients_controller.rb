class PatientsController < ApplicationController
  before_action :authenticate_patient!, except: [:index]
  before_action :admin_required, only: [:index]
  before_action :set_patient, only: %i[show update destroy]
  before_action :set_q, only: %i[index search]

  def index
    @patients = Patient.all.order(created_at: :asc).page(params[:page]).per(8)
  end

  def show
    if patient_signed_in?
      @patient = current_patient
    end
    @last_interview = @patient.health_interviews.last
  end

  def update
    @patient = current_patient
    if @patient.update(patient_params)
      redirect_to patient_path, notice: t('notice.updated')
    else
      render 'edit'
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, t('notice.destroyed')
  end

  def sign_in_required
    redirect_to new_patient_session_url unless patient_signed_in? || (staff_signed_in? && current_staff.admin)
  end

  def search
    @results = @q.result
  end

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: @last_interview.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    PaymentMailer.charged_mail(@last_interview).deliver
    redirect_to patient_path, notice: t('notice.paied')
  end

  private

    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(
        :name,
        :email,
        :tel,
        :address,
        :password,
        :password_confirmation
      )
    end

    def set_q
      @q = Patient.ransack(params[:q])
    end
end
