require 'rails_helper'

RSpec.describe ChecklistShare, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:checklist) }
  end
end
