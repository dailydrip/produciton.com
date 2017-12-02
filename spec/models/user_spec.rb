require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:uid) }
    it { is_expected.to respond_to(:provider) }
  end

  describe 'factory is ok' do
    it { FactoryGirl.create(:user) }
  end
end
