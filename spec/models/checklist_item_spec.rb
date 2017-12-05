require 'rails_helper'

RSpec.describe ChecklistItem, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:completed) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:checklist) }
  end
end
