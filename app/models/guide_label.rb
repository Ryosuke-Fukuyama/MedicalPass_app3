class GuideLabel < ApplicationRecord
  belongs_to :health_interview

  validates :status, presence: true
end
