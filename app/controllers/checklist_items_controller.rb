class ChecklistItemsController < ApplicationController
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

  def checklist_item_params
    params.require(:checklist_item).permit(:title, :completed)
  end
end
