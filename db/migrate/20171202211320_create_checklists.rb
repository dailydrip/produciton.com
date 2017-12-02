class CreateChecklists < ActiveRecord::Migration[5.1]
  def change
    create_table :checklists do |t|
      t.string :title, null: false, default: ''

      t.timestamps null: false
    end

    add_index :checklists, :title, unique: true
  end
end
