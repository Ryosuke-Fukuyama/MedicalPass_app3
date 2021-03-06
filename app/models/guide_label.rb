class GuideLabel < ApplicationRecord
  belongs_to :health_interview, optional: true
  belongs_to :staff, optional: true

  STATUSES = {
    initial: 0,
    calling: 1,
    done: 2,
    pending: 3,
    noshow: 4,
    complete: 5
  }
  enum status: STATUSES

  # validates :status, inclusion: { in: STATUSES.keys.concat(STATUSES.keys) }, exclusion: { in: [nil] }
end
