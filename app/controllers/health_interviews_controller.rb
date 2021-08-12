class HealthInterviewsController < ApplicationController
  before_action :set_health_interview_parms, only: %i[show edit update destroy]
  # before_action :set_guide_labels, only: %i[]
  before_action :patient_required, only: [:new]
  before_action :staff_required, only: %i[show edit]

  def index
    # render 'index', formats: 'json', handlers: 'jbuilder'
    @health_interviews = HealthInterview.eager_load(:guide_label).order(created_at: :asc)
    @health_interviews_0 = @health_interviews.search_initial if @health_interviews.search_initial.present?
    @health_interviews_1 = @health_interviews.search_calling if @health_interviews.search_calling.present?
    @health_interviews_3 = @health_interviews.search_pending if @health_interviews.search_pending.present?

    if patient_signed_in?
      @reserved = current_patient.health_interviews
      @last_status = reserved.last.guide_label
    end

    # @statuses = GuideLabel.statuses.keys
    # respond_to do |format|
    #   format.json {render json: { statuses: @statuses }}
    # end
  end

  # def done_index
  #   @health_interviews = HealthInterview.includes(:guide_label).order(created_at: :asc)
  #   @health_interviews_2 = @health_interviews.search_done if @health_interviews.search_done.present?
  #   @health_interviews_4 = @health_interviews.search_noshow.search_today if @health_interviews.search_noshow.present?
  # end

  def new
    @health_interviews = current_patient.health_interviews
    if @health_interviews.present? && (@health_interviews.last.guide_label.initial? ||
                                        @health_interviews.last.guide_label.calling? ||
                                        @health_interviews.last.guide_label.pending?
                                      )
      redirect_to patient_path(current_patient.id), notice: t('notice.already')
    end
    @health_interview = HealthInterview.new
    @health_interview.build_guide_label
  end

  def create
    @health_interview = current_patient.health_interviews.build(health_interview_params)
    if @health_interview.save
      redirect_to patient_path(current_patient.id), notice: t('notice.newinterview')
    else
      render :new
    end
  end

  def show
    @patient = @health_interview.patient
  end

  def edit; end

  def update
    @guide_label = @health_interview.guide_label
    if action_name == 'index'
      respond_to do |format|
        if @guide_label.update(guide_label_params)
          format.json { render json: { registration: 'OK！' } }
          # render 'index', formats:'json', handlers: 'jbuilder'
        else
          format.json { render json: { registration: 'ERROR!!!' } }
        end
      end
    elsif action_name == 'edit'
      if @health_interview.update(health_interview_params)
        redirect_to hospital_health_interview_path, notice: t('notice.updated')
      else
        render :edit
      end
    end
  end

  def destroy
    @health_interview.destroy
  end

  private

    def set_health_interview_parms
      @health_interview = HealthInterview.find(params[:id])
    end

    def health_interview_params
      params.require(:health_interview).permit(
        :age,
        :gender,
        :symptomatology,
        :condition,
        :comment,
        :price,
        :hospital_id,
        guide_label_attributes: [
          :id,
          :status
         #  :staff_id
        ]
      )
    end

    def set_guide_labels
      @guide_labels = GuideLabel.all
    end

    def guide_label_params
      params.require(:guide_label).permit(:id, :status)
    end
end
