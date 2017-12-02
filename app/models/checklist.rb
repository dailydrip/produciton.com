class Checklist < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end
