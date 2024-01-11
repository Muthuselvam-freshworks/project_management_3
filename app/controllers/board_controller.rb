class BoardController < ApplicationController
    #setting  project by project id in params
    before_action :set_project

    #handling the index page in board/index 
    def index
      @todo_tasks = @project.tasks.where(status: 'todo')
      @in_progress_tasks = @project.tasks.where(status: 'In Progress')
      @done_tasks = @project.tasks.where(status: 'Completed')
    end
    
    private

    def set_project
    @project = Project.find(params[:id])
    end

end
