class AddUsersToChecklists < ActiveRecord::Migration[5.1]
  def change
    add_reference :checklists, :user, foreign_key: true
  end
end
