# Preview all emails at http://localhost:3000/rails/mailers/share_checklist
class ShareChecklistPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/share_checklist/email
  def email
    ShareChecklistMailer.email
  end
end
