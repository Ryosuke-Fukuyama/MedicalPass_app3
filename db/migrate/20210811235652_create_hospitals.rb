class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :email
      t.integer :tel
      t.string :address
      t.string :access
      t.text :image
      t.text :introduction

      t.timestamps
    end
  end
end
