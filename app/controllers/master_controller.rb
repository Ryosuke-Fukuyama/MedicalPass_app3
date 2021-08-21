class MasterController < ApplicationController
  def create
    @master = Master.create(master_params)
  end

  def edit: end

  def update
    @master = Master.update(master_params)
  end

  private

  def master_params
    params.require(:master).permit(
      :password,
      :password_confirmation
    )
end
