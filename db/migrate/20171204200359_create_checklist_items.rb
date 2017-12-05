class CreateChecklistItems < ActiveRecord::Migration[5.1]
  def change
    create_table :checklist_items do |t|
      t.references :checklist, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
