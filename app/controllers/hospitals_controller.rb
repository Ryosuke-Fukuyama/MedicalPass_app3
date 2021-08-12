class HospitalsController < ApplicationController
  before_action :set_hospital, only: %i[show edit update destroy]
  before_action :set_hospital_labels, only: %i[index new edit create]

  def index
    @hospitals = Hospital.all.order(name: :asc).page(params[:page]).per(8)
  end

  def show; end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to hospitals_path, notice: t('notice.saved')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @hospital.update(hospital_params)
      redirect_to hospitals_path, notice: t('notice.updated')
    else
      render :new
    end
  end

  def destroy
    @hospital.destroy
    redirect_to hospitals_path, notice: t('notice.destroyed')
  end

  private

    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    def set_hospital_labels
      @hospital_labels = HospitalLabel.all
    end

    def hospital_params
      params.require(:hospital).permit(
        :name,
        :email,
        :tel,
        :address,
        :access,
        :image,
        :introduction,
        { hospital_label_ids: [] }
      )
    end
end
