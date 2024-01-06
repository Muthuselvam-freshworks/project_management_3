class BoardController < ApplicationController
  before_action :set_project
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :move_to_in_progress, :move_to_completed]

  def index
    @todos_todo = @project.todos.where(status: 'Todo')
    @todos_in_progress = @project.todos.where(status: 'In Progress')
    @todos_completed = @project.todos.where(status: 'Completed')
    @todo = @project.todos.new
  end

  def show
    # Show individual todo details
  end

  def new
    @todo = @project.todos.new
  end

  def create
    @todo = @project.todos.build(todo_params)
    if @todo.save
      redirect_to project_todos_path(@project), notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Render edit form
  end

  def update
    if @todo.update(todo_params)
      redirect_to project_todos_path(@project), notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to project_todos_path(@project), notice: 'Todo was successfully destroyed.'
  end

  def move_to_in_progress
    move_todo_to_status('In Progress')
  end

  def move_to_completed
    move_todo_to_status('Completed')
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_todo
    @todo = @project.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :tags, :due_date, :status)
  end

  def move_todo_to_status(status)
    @todo.update(status: status)
    redirect_to project_todos_path(@project), notice: "Todo moved to #{status}."
  end
end
