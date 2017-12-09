class AddAcceptedToChecklistShares < ActiveRecord::Migration[5.1]
  def change
    add_column :checklist_shares, :accepted, :boolean
  end
end
