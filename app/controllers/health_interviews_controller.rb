class HealthInterviewsController < ApplicationController
  before_action :set_health_interview_parms, only: [:show, :edit, :update, :destroy]
  before_action :set_guide_labels, only: [:index, :edit, :update]
  # before_action :patient_required, only: [:new]
  # before_action :staff_required, only: [:show, :edit]

  def index
    @health_interviews = HealthInterview.includes(:guide_label).order(created_at: :asc)
    @health_interviews_0 = @health_interviews.search_initial if @health_interviews.search_initial.present?
    @health_interviews_1 = @health_interviews.search_calling if @health_interviews.search_calling.present?
    @health_interviews_3 = @health_interviews.search_pending if @health_interviews.search_pending.present?
  end

  def new
    # @health_interviews = current_patient.health_interviews
    # if @health_interviews.present? && ( @health_interviews.last.guide_label.initial? ||
    #                                     @health_interviews.last.guide_label.calling? ||
    #                                     @health_interviews.last.guide_label.pending?
    #                                   )
    #   redirect_to patient_path(current_patient.id), notice: t('notice.saved')
    # end
    @health_interview = HealthInterview.new
    @health_interview.build_guide_label
  end

  def create
    # @health_interview = current_patient.health_interviews.build(health_interview_params)
    if @health_interview.save
      # redirect_to patient_path(current_patient.id), notice: t('notice.newinterview')
    else
      render :new
    end
  end

  def show
    # @patient = @health_interview.patient
  end

  def edit
  end

  def update
    if @health_interview.update(health_interview_params)
      redirect_to health_interview_path, notice: t('notice.update')
    else
      render :edit
    end
  end

  def destroy
    @health_interview.destroy
  end

  private

  def set_health_interview_parms
    @health_interview = HealthInterview.find(params[:id])
  end

  def set_guide_labels
    @guide_labels = GuideLabel.all
  end

  def health_interview_params
    params.require(:health_interview).permit(
                                             :symptomatology,
                                             :condition,
                                             :comment,
                                             :price,
                                             guide_label_attributes: [
                                               :id,
                                               :status,
                                              #  :health_interview_id,
                                              #  :staff_id
                                              ]
                                            )
  end
end
