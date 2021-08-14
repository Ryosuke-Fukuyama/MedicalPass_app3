class AddHospitalRefToHospitalLabeling < ActiveRecord::Migration[5.2]
  def change
    add_reference :hospital_labelings, :hospital, foreign_key: true
  end
end
