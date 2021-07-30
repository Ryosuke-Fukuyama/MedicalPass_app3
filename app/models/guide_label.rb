class GuideLabel < ApplicationRecord
  belongs_to :health_interview

  validates :status, presence: true

  enum status: { initial: 0, calling: 1, done: 2, pending: 3, noshow: 4, complete: 5 }
end
