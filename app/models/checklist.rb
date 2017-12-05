class Checklist < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :checklist_items, dependent: :destroy

  def all_done?
    checklist_items.pluck(:completed).all?
  end
end
