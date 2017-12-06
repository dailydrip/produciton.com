require 'rails_helper'

RSpec.describe ShareChecklistMailer, type: :mailer do
  describe 'email' do
    let(:mail) { ShareChecklistMailer.email }

    it 'renders the headers' do
      expect(mail.subject).to eq('Email')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
