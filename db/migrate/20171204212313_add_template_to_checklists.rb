class AddTemplateToChecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :template, :boolean
    add_index :checklists, :template
  end
end
