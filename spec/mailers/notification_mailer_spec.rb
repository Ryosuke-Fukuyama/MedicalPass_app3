require 'rails_helper'

RSpec.describe NotificationMailer, type: :mailer do
  describe 'soon' do
    let(:mail) { NotificationMailer.soon }

    it 'renders the headers' do
      expect(mail.subject).to eq('Soon')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end

  describe 'bill' do
    let(:mail) { NotificationMailer.bill }

    it 'renders the headers' do
      expect(mail.subject).to eq('Bill')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
