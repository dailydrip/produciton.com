class ChecklistsController < ApplicationController
  def index
    @checklists = Checklist.all
  end

  def show
    @checklist = Checklist.find(params[:id])
  end

  def update
    @checklist = Checklist.find(params[:id])
    @checklist.update(checklist_params)
  end

  private

  def checklist_params
    params.require(:checklist).permit(:title, :template,
      checklist_items: %i[title completed])
  end
end
