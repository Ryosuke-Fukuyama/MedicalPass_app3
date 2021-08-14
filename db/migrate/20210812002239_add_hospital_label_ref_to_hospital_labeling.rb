class AddHospitalLabelRefToHospitalLabeling < ActiveRecord::Migration[5.2]
  def change
    add_reference :hospital_labelings, :hospital_label, foreign_key: true
  end
end
