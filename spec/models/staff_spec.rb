require 'rails_helper'

RSpec.describe Staff, type: :model do
  describe 'association' do
    it { should have_many(:guide_labels) }
  end

  describe 'varidation' do
    # let!(:hospital) { FactoryBot.create(:hospital) }
    # let!(:staff) { FactoryBot.create(:staff, hospital_id: hospital.id) }
    context 'name' do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_least(1) }
      it { should validate_length_of(:name).is_at_most(20) }
    end
    context 'password' do
      it { should validate_presence_of(:password).on(:create) }
    end
  end
end
