require 'rails_helper'

RSpec.describe Checklist, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'fields' do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:template) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:checklist_items) }
  end

  describe 'factory is ok' do
    it 'creates a checklist' do
      expect(create(:checklist)).to be_a(Checklist)
    end
  end
end
