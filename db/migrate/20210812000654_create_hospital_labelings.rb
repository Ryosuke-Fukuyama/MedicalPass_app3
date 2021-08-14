class CreateHospitalLabelings < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_labelings do |t|

      t.timestamps
    end
  end
end
