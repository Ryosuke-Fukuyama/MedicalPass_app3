class CreateGuideLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :guide_labels do |t|
      t.integer :status
      t.references :health_interview, foreign_key: true

      t.timestamps
    end
  end
end
