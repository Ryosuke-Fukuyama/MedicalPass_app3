require 'rails_helper'

RSpec.describe HealthInterview, type: :model do
  let!(:health_interview_0) { FactoryBot.create(:health_interview) }
  let!(:health_interview_1) { FactoryBot.create(:health_interview) }
  let!(:health_interview_3) { FactoryBot.create(:health_interview) }
  let!(:guide_label_0) { FactoryBot.create(:guide_label, health_interview_id: health_interview_0.id) }
  let!(:guide_label_1) { FactoryBot.create(:guide_label, health_interview_id: health_interview_1.id, status: "calling") }
  let!(:guide_label_3) { FactoryBot.create(:guide_label, health_interview_id: health_interview_3.id, status: "pending") }

  describe 'scopeのテスト' do
    before do
      @health_interviews = HealthInterview.includes(:guide_label)
    end
    context 'scopeメソッドで絞り込み' do
      example 'initialのみ' do
        expect(@health_interviews.search_initial.sample.guide_label.status).to eq 'initial'
      end
      example 'callingのみ' do
        expect(@health_interviews.search_calling.sample.guide_label.status).to eq 'calling'
      end
      example 'pendingのみ' do
        expect(@health_interviews.search_pending.sample.guide_label.status).to eq 'pending'
      end
      example 'doneのみ' do
        expect(@health_interviews.search_done.sample.guide_label.status).to eq 'done'
      end
      example 'noshowのみ' do
        expect(@health_interviews.search_noshow.sample.guide_label.status).to eq 'noshow'
      end
    end
  end
end
