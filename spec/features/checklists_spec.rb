require 'rails_helper'

RSpec.feature 'Checklists', type: :feature do
  # We'll set up a checklist and some items under it
  let!(:ruby) { create(:checklist, title: 'Ruby') }
  let!(:configure_ssl) { create(:checklist_item, title: 'Configure SSL', checklist: ruby) }
  let!(:set_up_cdn) { create(:checklist_item, title: 'Set up CDN', checklist: ruby) }

  scenario 'viewing a checklist' do
    visit checklist_path(ruby)

    expect(page).to have_title("#{ruby} | Produciton")
    expect(page).to have_incompleted_checklist_item(configure_ssl)
    expect(page).to have_incompleted_checklist_item(set_up_cdn)
  end

  scenario 'completing a checklist item' do
    visit checklist_path(ruby)
    complete_checklist_item(configure_ssl)

    expect(page).to have_incompleted_checklist_item(set_up_cdn)
    expect(page).to have_completed_checklist_item(configure_ssl)
  end

  scenario 'completing all checklist items' do
    visit checklist_path(ruby)
    complete_checklist_item(configure_ssl)
    complete_checklist_item(set_up_cdn)

    expect(page).to have_text("Everything's finished!")
  end

  scenario 'sharing a checklist with another user' do
    visit checklist_path(ruby)
    share_checklist_with('bob@example.com')
    expect(page).to have_pending_share_for('bob@example.com')
    accept_share_for('bob@example.com', ruby)
    visit checklist_path(ruby)
    expect(page).to have_accepted_share_for('bob@example.com')
  end

  scenario 'adding a checklist item' do
    visit checklist_path(ruby)

    fill_in '#new_checklist_item_title', with: 'New Item'
    click_button 'Add checklist item'
    expect(page).to have_incompleted_checklist_item('New Item')
  end

  scenario 'removing a checklist item' do
    visit checklist_path(ruby)

    expect(page).to have_incompleted_checklist_item(ruby)

    within(checklist_item_selector(ruby)) do
      click_button 'Remove checklist item'
    end
    expect(page).not_to have_incompleted_checklist_item(ruby)
  end

  scenario 'editing a checklist item title' do
    visit checklist_path(ruby)

    expect(page).to have_incompleted_checklist_item(ruby)
    within(checklist_item_selector(ruby)) do
      click_link 'Edit'
      fill_in '.checklist_item_title', with: 'Ruby 3'
    end
    expect(page).to have_incompleted_checklist_item('Ruby 3')
  end
end
