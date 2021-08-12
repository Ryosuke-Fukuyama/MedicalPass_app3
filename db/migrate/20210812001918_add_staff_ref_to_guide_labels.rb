class AddStaffRefToGuideLabels < ActiveRecord::Migration[5.2]
  def change
    add_reference :guide_labels, :staff, foreign_key: true
  end
end
