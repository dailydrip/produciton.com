class ShareChecklistMailer < ApplicationMailer
  def email(from_id, to_id, checklist_id)
    @to_user = User.find(to_id)
    @from_user = User.find(from_id)
    @checklist = Checklist.find(checklist_id)
    mail(
      from: Rails.application.secrets.produciton_email,
      to: @to_user.email,
      subject: "#{@from_user.email} has shared a Checklist with you!"
    )
  end
end
