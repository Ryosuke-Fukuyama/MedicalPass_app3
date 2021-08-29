class AddPatientRefToHealthInterviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :health_interviews, :patient, foreign_key: true
  end
end
