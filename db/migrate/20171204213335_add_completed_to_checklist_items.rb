class AddCompletedToChecklistItems < ActiveRecord::Migration[5.1]
  def change
    add_column :checklist_items, :completed, :boolean
  end
end
