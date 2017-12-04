class ChecklistsController < ApplicationController
  def index
    @checklists = Checklist.all
  end
end
