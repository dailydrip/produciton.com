class ChecklistSharesController < ApplicationController
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
end
