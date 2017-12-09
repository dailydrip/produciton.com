require 'rails_helper'

RSpec.feature 'Home Screen', type: :feature do
  let!(:ruby) { create(:checklist, title: 'Ruby') }
  let!(:elm) { create(:checklist, title: 'Elm') }
  let(:user) { create(:user) }

  scenario 'displays checklists' do
    visit checklist_path(ruby)
    log_in(user)
    visit root_path

    expect(page).to have_checklist_link('Ruby')
    expect(page).to have_checklist_link('Elm')
  end
end
