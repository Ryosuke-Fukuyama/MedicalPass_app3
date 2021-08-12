class CreateHospitalLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_labels do |t|
      t.integer :name

      t.timestamps
    end
  end
end
