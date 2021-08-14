class HospitalsController < ApplicationController
  before_action :set_hospital_labels, only: %i[index new edit create]
  before_action :set_q, only: %i[index search]

  def index
    @hospitals = Hospital.all.order(name: :asc).page(params[:page]).per(8)
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

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

  def maps
    gon.hosupitals = Hospital.all
  end

  def search
    @results = @q.result
  end

  private

    def set_hospital_labels
      @hospital_labels = HospitalLabel.all
    end

    def hospital_params
      params.require(:hospital).permit(
        :id,
        :name,
        :email,
        :tel,
        :address,
        :access,
        :introduction,
        :image,
        hospital_label_ids: []
      )
    end

    def set_q
      @q = Hospital.ransack(params[:q])
    end
end
