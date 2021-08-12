class AddDetailsHospitals < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :latitude, :float
    add_column :hospitals, :longitude, :float
  end
end
