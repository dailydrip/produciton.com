require 'rails_helper'

RSpec.describe ShareChecklistMailer, type: :mailer do
  describe 'email' do
    let(:from_user) { double('User', email: 'from@example.com') }
    let(:to_user) { double('User', email: 'to@example.org') }
    let(:checklist) { double('Checklist', id: 1) }
    let(:mail) { ShareChecklistMailer.email(from_user, to_user, checklist) }

    it 'renders the headers' do
      expect(mail.subject).to eq("#{from_user.email} has shared a Checklist with you!")
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq([ENV['PRODUCITON_EMAIL']])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include('Howdy')
    end
  end
end
