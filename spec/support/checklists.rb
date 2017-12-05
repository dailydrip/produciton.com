def complete_checklist_item(item)
  find(:css, "#complete-checklist-item-#{item.id}").click
end
