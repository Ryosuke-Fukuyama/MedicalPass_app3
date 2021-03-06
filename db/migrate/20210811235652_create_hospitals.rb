class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name,    null: false
      t.string :email,   null: false
      t.string :tel,     null: false
      t.string :address, null: false
      t.string :access,  null: false
      t.text :image
      t.text :introduction

      t.timestamps
    end
  end
end
