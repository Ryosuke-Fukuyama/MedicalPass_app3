class HealthInterview < ApplicationRecord
  has_one :guide_label
  accepts_nested_attributes_for :guide_label, allow_destroy: true
end
