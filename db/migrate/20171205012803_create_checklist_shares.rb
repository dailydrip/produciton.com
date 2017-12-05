class CreateChecklistShares < ActiveRecord::Migration[5.1]
  def change
    create_table :checklist_shares do |t|
      t.references :user, foreign_key: true
      t.references :checklist, foreign_key: true

      t.timestamps
    end
  end
end
