class Api::HealthInterviewsController < ApplicationController

  def update
    @health_interview = HealthInterview.find(params[:id])
    @guide_label = @health_interview.guide_label
    @hospital.health_interviews << @health_interview
    respond_to do |format|
      if @guide_label.update(guide_label_params)
        flash.now[:notice] = 'OK!'
        render 'index', formats:'json', handlers: 'jbuilder'
      # else
      #   flash.now[:alert] = 'ERROR!!!'
      #   render json: @health_interview.errors, status: :unprocessable_entity
      end
    end
  end

  # def notify
  #   @health_interview = HealthInterview.find(params[:id])
  #   @hospital.health_interviews << @health_interview
  #   respond_to do |format|
  #     if @health_interview.update(health_interview_params)
  #       @email = @health_interview.patient.email
  #       NotificationMailer.soon_mail(@health_interview, @email).deliver_later if @health_interview.notification?
  #       flash.now[:notice] = t('notice.notified')
  #       render 'index', formats:'json', handlers: 'jbuilder'
  #     else
  #       flash.now[:alert] = 'ERROR!!!'
  #       render json: @health_interview.errors, status: :unprocessable_entity
  #     end
  #   end
  # end

  private

  def health_interview_params
    params.require(:health_interview).permit(
      :age,
      :gender,
      :symptomatology,
      :condition,
      :comment,
      :price,
      :hospital_id,
      :notification,
      guide_label_attributes: [
        :id,
        :status
        #  :staff_id
      ]
    )
  end

  def guide_label_params
    params.require(:guide_label).permit(
      :id,
      :status
    )
  end
end