class ChecklistItemsController < ApplicationController
  before_action :find_checklist, only: %i[new create edit destroy]

  def new
    @checklist_item = ChecklistItem.new(checklist: @checklist)
  end

  def create
    @checklist_item = ChecklistItem.new(checklist_item_params)
    @checklist_item.checklist = @checklist
    @checklist_item.save!
    flash[:success] = 'Item created'
    redirect_to @checklist
  end

  def edit
    @checklist_item = @checklist.checklist_items.find(params[:id])
  end

  def destroy
    @checklist_item = @checklist.checklist_items.find(params[:id])
    @checklist_item.destroy
    redirect_to @checklist
  end

  def update
    @checklist_item = ChecklistItem.find(params[:id])
    if @checklist_item.update(checklist_item_params)
      flash[:success] = 'Item updated!'
    else
      flash[:error] = 'Failed to update the item.'
    end
    redirect_to @checklist_item.checklist
  end

  private

  def find_checklist
    @checklist = Checklist.find(params[:checklist_id])
  end

  def checklist_item_params
    params.require(:checklist_item).permit(:title, :completed)
  end
end
