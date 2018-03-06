require 'rails_helper'

RSpec.describe ShareChecklistMailer, type: :mailer do
  describe 'email' do
    let(:from_user) { double('User', email: 'from@example.com', id: 1) }
    let(:to_user) { double('User', email: 'to@example.org', id: 2) }
    let(:checklist) { double('Checklist', id: 1) }
    let(:mail) { ShareChecklistMailer.email(from_user.id, to_user.id, checklist.id) }
    before do
      expect(User).to receive(:find).with(1).and_return(from_user)
      expect(User).to receive(:find).with(2).and_return(to_user)
      expect(Checklist).to receive(:find).with(1).and_return(checklist)
    end

   it 'renders the headers' do
      expect(mail.subject).to eq("#{from_user.email} has shared a Checklist with you!")
      expect(mail.to).to eq(['to@example.org'])
      prod_email = ENV['PRODUCITON_EMAIL'] ? [ENV['PRODUCITON_EMAIL']] : []
      expect(mail.from).to eq(prod_email)
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include('Howdy')
    end
  end
end
