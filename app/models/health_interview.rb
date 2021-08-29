class HealthInterview < ApplicationRecord
  belongs_to :patient
  belongs_to :hospital
  has_one :guide_label, dependent: :destroy
  accepts_nested_attributes_for :guide_label, allow_destroy: true

  enum gender: { man: 0, woman: 1 }

  scope :search_initial, -> { where(guide_labels: { status: 'initial' }) }
  scope :search_calling, -> { where(guide_labels: { status: 'calling' }) }
  scope :search_pending, -> { where(guide_labels: { status: 'pending' }) }
  scope :search_done, -> { where(guide_labels: { status: 'done' }) }
  scope :search_noshow, -> { where(guide_labels: { status: 'noshow' }) }
  scope :search_today, -> { where(updated_at: Time.current.all_day) }
end
