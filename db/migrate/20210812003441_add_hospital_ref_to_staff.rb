class AddHospitalRefToStaff < ActiveRecord::Migration[5.2]
  def change
    add_reference :staffs, :hospital, foreign_key: true
  end
end
