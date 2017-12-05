module ApplicationHelper
  def checklist_item_class(item)
    item.completed ? 'completed' : 'uncompleted'
  end
end
