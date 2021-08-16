class AddNotificationToHealthInterviews < ActiveRecord::Migration[5.2]
  def change
    add_column :health_interviews, :notification, :boolean, default: false
  end
end
