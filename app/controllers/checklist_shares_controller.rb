class ChecklistSharesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def accept
    email = params[:email]
    checklist_id = params[:checklist_id]

    user = User.find_by(email: email)
    flash_and_redirect('The user does not exist') unless user

    checklist_share = ChecklistShare.find_by(user: user, checklist_id: checklist_id)
    flash_and_redirect('We could not find this invitation') unless checklist_share

    checklist_share.update(accepted: true)
    flash[:success] = 'You have accepted the Checklist'
    redirect_to root_path
  end

  def create
    begin
      checklist = Checklist.find(params[:checklist_id])
      checklist.share_with(current_user, params[:email])
      flash[:success] = "Checklist shared with #{params[:email]}!"
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = e.message
    end
    redirect_to root_path
  end

  private

  def flash_error_message_and_redirect(msg)
    (flash[:error] = msg) && redirect_to(root_path)
  end
end
