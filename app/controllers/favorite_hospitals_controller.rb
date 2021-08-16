class FavoriteHospitalsController < ApplicationController
  before_action :patient_required

  def index
    @favorite_hospitals = current_patient.favorite_hospitals.all.order(created_at: :desc)
  end

  def create
    favorite = current_patient.favorite_hospitals.create(hospital_id: params[:hospital_id])
    redirect_to hospital_path(@hospital), notice: "#{favorite.hospital.name}" + t('notice.on_favorite')
  end

  def destroy
    favorite = current_patient.favorites_hospitals.find_by(id: params[:id]).destroy
    redirect_to hospital_path(@hospital), notice: "#{favorite.hospital.name}" + t('notice.off_favorited')
  end
end
