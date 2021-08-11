class StaffsController < ApplicationController
  before_action :admin_required
  before_action :set_staff, only: [:edit, :update, :destroy]

  def index
    @staffs = Staff.sorted.pagination(params)
  end

  def update
    if @staff.update(staff_params)
      redirect_to staffs_path, notice: t('notice.updated')
      # I18n.t('views.messages.update_profile')
    else
      render 'edit'
    end
  end

  def destroy
    @staff.destroy
    redirect_to staffs_path, notice: t('notice.destroyed')
  end

  private

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:name, :password, :password_confirmation, :admin)
  end
end
