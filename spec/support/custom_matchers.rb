RSpec::Matchers.define :have_checklist_link do |expected|
  match do |actual|
    selector = 'ul.checklist-list > li > a'
    expect(actual).to have_selector(selector, text: expected.to_s)
  end

  description do
    "have a checklist link for #{expected}"
  end
end
