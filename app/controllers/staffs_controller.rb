class StaffsController < ApplicationController
  before_action :admin_required
  before_action :set_staff, only: %i[edit update destroy]
  before_action :set_q, only: %i[index search]

  def index
    @staffs = Staff.all.order(created_at: :asc).page(params[:page]).per(8) # pagination(params)
  end

  def update
    if @staff.update(staff_params)
      redirect_to staffs_path, notice: t('notice.updated')
    else
      render 'edit'
    end
  end

  def destroy
    @staff.destroy
    redirect_to staffs_path, notice: t('notice.destroyed')
  end

  def search
    @results = @q.result
  end

  private

    def set_staff
      @staff = Staff.find(params[:id])
    end

    def staff_params
      params.require(:staff).permit(
        :name,
        :password,
        :password_confirmation,
        :admin,
        :hospital_id
      )
    end

    def set_q
      @q = Staff.ransack(params[:q])
    end
end
