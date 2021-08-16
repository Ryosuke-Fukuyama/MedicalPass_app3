class CreateFavoriteHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_hospitals do |t|
      t.integer :patient_id
      t.integer :hospital_id

      t.timestamps
    end
  end
end
