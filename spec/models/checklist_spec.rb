require 'rails_helper'

RSpec.describe Checklist, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'fields' do
    it { is_expected.to respond_to(:title) }
  end

  describe 'factory is ok' do
    it { FactoryGirl.create(:checklist) }
  end
end
