class Checklist < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :checklist_items, dependent: :destroy

  def all_done?
    checklist_items.pluck(:completed).all?
  end

  def share_with(current_user, email)
    user = User.find_by(email: email)
    user ||= User.create_with_password(email: email)
    ChecklistShare.find_or_create_by(user: user, checklist: self)
    MailerJob.perform_async("ShareChecklistMailer", :email, current_user.id, user.id, self.id)
  end
end
