require 'rails_helper'

RSpec.describe HospitalLabel, type: :model do
  describe 'association' do
    it { should have_many(:hospital_labelings) }
    it { should have_many(:hospitals) }
  end
end
