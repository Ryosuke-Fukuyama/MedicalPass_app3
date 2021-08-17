require 'rails_helper'

RSpec.describe GuideLabel, type: :model do
  describe 'enum status' do
    it { is_expected.to define_enum_for(:status).with_values(
      initial: 0,
      calling: 1,
      done: 2,
      pending: 3,
      noshow: 4,
      complete: 5
    ) }
  end