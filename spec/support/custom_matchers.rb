RSpec::Matchers.define :have_checklist_link do |expected|
  match do |actual|
    selector = 'ul.checklist-list > li > a'
    expect(actual).to have_selector(selector, text: expected.to_s)
  end

  description do
    "have a checklist link for #{expected}"
  end
end

RSpec::Matchers.define :have_uncompleted_checklist_item do |expected|
  match do |actual|
    selector = 'ul.checklist-list > li.uncompleted'
    expect(actual).to have_selector(selector, text: expected.title.to_s)
  end

  description do
    "have an uncompleted checklist item link for #{expected}"
  end
end

RSpec::Matchers.define :have_completed_checklist_item do |expected|
  match do |actual|
    selector = 'ul.checklist-list > li.completed'
    expect(actual).to have_selector(selector, text: expected.title.to_s)
  end

  description do
    "have a completed checklist item link for #{expected}"
  end
end

RSpec::Matchers.define :have_pending_share_for do |expected|
  match do |actual|
    text = "Checklist shared with #{expected}!"
    expect(actual).to have_text(text)
  end

  description do
    "have a pending share for #{expected}"
  end
end

RSpec::Matchers.define :have_accepted_share do |_expected|
  match do |actual|
    text = 'You have accepted the Checklist'
    expect(actual).to have_text(text)
  end

  description do
    'have accepted share'
  end
end
