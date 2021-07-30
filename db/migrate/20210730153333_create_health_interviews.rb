class CreateHealthInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :health_interviews do |t|
      t.text :symptomatology
      t.text :condition
      t.text :comment
      t.integer :price

      t.timestamps
    end
  end
end
