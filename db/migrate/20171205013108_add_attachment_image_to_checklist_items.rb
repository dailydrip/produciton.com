class AddAttachmentImageToChecklistItems < ActiveRecord::Migration[4.2]
  def self.up
    change_table :checklist_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :checklist_items, :image
  end
end
