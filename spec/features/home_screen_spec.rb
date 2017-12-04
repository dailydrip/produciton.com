require 'rails_helper'

RSpec.feature 'Home Screen', type: :feature do
  let!(:ruby) { create(:checklist, title: 'Ruby') }
  let!(:elm) { create(:checklist, title: 'Elm') }

  scenario 'displays checklists' do
    visit root_path

    expect(page).to have_checklist_link('Ruby')
    expect(page).to have_checklist_link('Elm')
  end
end
