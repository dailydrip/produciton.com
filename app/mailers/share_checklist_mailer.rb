class ShareChecklistMailer < ApplicationMailer
  def email(from_user, to_user, checklist)
    @to_user = to_user
    @from_user = from_user
    @checklist = checklist
    mail(
      from: Rails.application.secrets.produciton_email,
      to: @to_user.email,
      subject: "#{@from_user.email} has shared a Checklist with you!"
    )
  end
end
