class CreateChecklistItems < ActiveRecord::Migration[5.1]
  def change
    create_table :checklist_items do |t|
      t.string :title
      t.references :checklist, foreign_key: true

      t.timestamps
    end
  end
end
