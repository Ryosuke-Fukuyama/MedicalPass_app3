require 'rails_helper'

RSpec.describe GuideLabel, type: :model do
  let!(:health_interview) { FactoryBot.create(:health_interview) }

  describe 'バリデーションのテスト' do
    context 'ステータスが空の場合' do
      it 'バリデーションにひっかる' do
        guide_label = GuideLabel.new(status: '', health_interview_id: health_interview.id)
        expect(guide_label).not_to be_valid
      end
    end

    context 'ステータスが記載されている場合' do
      it 'バリデーションが通る' do
        guide_label = GuideLabel.new(status: 'calling')
        expect(guide_label).to be_valid
      end
    end
  end
end
