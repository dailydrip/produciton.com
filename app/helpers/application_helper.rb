module ApplicationHelper
  def checklist_item_class(item)
    item.completed ? 'completed' : 'uncompleted'
  end

  def checklist_item_button(item)
    item.completed ? 'Mark as Uncompleted' : 'Mark as Completed'
  end
end
