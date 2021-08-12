class AddHospitalRefToHealthInterview < ActiveRecord::Migration[5.2]
  def change
    add_reference :health_interviews, :hospital, foreign_key: true
  end
end
