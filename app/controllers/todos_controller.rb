class TodosController < ApplicationController
    before_action :set_project
    before_action :set_todo, only: [:show, :edit, :update, :destroy, :move_to_in_progress, :move_to_completed]
  
    def index
      @todos_todo = @project.todos.where(status: 'Todo')
      @todos_in_progress = @project.todos.where(status: 'In Progress')
      @todos_completed = @project.todos.where(status: 'Completed')
      @todo = @project.todos.new
    end
  
    def show
        @project = Project.find(params[:id])
      # Show individual todo details
    end
  
    def new
      @todo = @project.todos.new
    end
  
    def create
      @todo = @project.todos.new(todo_params)
      @todo.created_user_id = current_user.id
      respond_to do |format|
        if @todo.save
          format.js   # This line will look for create.js.erb in your views/todos folder
        else
          format.js   # This line will look for create.js.erb in your views/todos folder
        end
      end
    end
  
    def edit
      # Render edit form
    end
  
    def update
      if @todo.update(todo_params)
        redirect_to project_board_index_path(@project), notice: 'Todo was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @todo.destroy
      redirect_to project_board_index_path(@project), notice: 'Todo was successfully destroyed.'
    end
  
    def move_to_in_progress
      move_todo_to_status('In Progress')
    end
  
    def move_to_completed
      move_todo_to_status('Completed')
    end

    def move_todo
        @todo = Todo.find(params[:id])
        @todo.update(position: params[:position])
        @todo.update(status: params[:status])
        head :ok
      end
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])
    end
  
    def set_todo
      @todo = @project.todos.find(params[:id])
    end
  
    def todo_params
        params.require(:todo).permit(:status, :name, :tags, :due_date)
      end
  
    def move_todo_to_status(status)
      @todo.update(status: status)
      redirect_to project_todos_path(@project), notice: "Todo moved to #{status}."
    end
  end
  