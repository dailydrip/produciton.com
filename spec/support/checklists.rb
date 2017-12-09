def log_in(user)
  fill_in('Email', with: user.email)
  fill_in('Password', with: user.password)
  click_on('Log in')
end

def complete_checklist_item(item)
  find(:css, "#complete-checklist-item-#{item.id}").click
end

def share_checklist_with(email)
  fill_in('email', with: email)
  click_on('Share')
end

def accept_share_for(email, checklist)
  visit accept_checklist_url(email: email, checklist_id: checklist.id)
end

def checklist_item_selector(item)
  "#item-#{item.id}"
end
