class ChecklistItem < ApplicationRecord
  belongs_to :checklist
  validates :title, presence: true

  has_attached_file :image
  validates_attachment_content_type :image, content_type: %r{/\Aimage\/.*\z/}
end
