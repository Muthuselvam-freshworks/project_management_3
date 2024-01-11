class TasksController < ApplicationController
    #setting project by getting project id from params
    before_action :set_project
    #setting the task by getting task id from params for specified actions 
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    #updating the background color for all task to display in the calendar
    before_action :update_all_background_colors, only: [:index]
  
    #getting all the details in index of tasks page
    def index
      @tasks = @project.tasks
      @project = Project.find(params[:project_id])
      @task = @project.tasks.build
      @users = User.all
      @comments = @task.comments.order(created_at: :desc)
      @assignable_users = assignable_users
      @comment = Comment.new
    end
  
    #rendering the comment page
    def show
      @comment_task = Task.find(params[:id])
      @comments = @task.comments.order(created_at: :desc)
      @new_comment = Comment.new
      render json: @comments
    end
  
    #create method for creating the comments
    def create_comment
      @task = Task.find(params[:id])
      @comment = @task.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to task_path(@task), notice: 'Comment added successfully.'
      else
        render :show
      end
    end

    #rendering the new task form 
    def new
      @task = @project.tasks.build
      @users = User.all
    end

    #create method for project 
    def create
      @project = Project.find(params[:project_id])
      @task = @project.tasks.build(task_params)
      if @task.save
        redirect_to project_tasks_path(@project), notice: 'Task was successfully created.'
      else
        render :new
      end
    end

    #to show the assignee in every project
    def assignable_users
      if @project.belongs_to_current_user?(current_user)
        @project.users + [current_user]
      else
        @project.users
      end
    end

   #rendering the edit form for task
    def edit
      @users = User.all
      @task = Task.find(params[:id])
    end
  
    #handling the submission in edit form for task
    def update
      if @task.update(task_params)
        redirect_to project_tasks_path(@project), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    #method to deleting the project 
    def destroy
      @task.destroy
      redirect_to project_tasks_path(@project), notice: 'Task was successfully destroyed.'
    end
   
    #private methods for setting the before action things
    private
    
    def comment_params
      params.require(:comment).permit(:body)
    end

    def update_all_background_colors
      @project.tasks.each(&:update_background_color)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :start_date, :due_date, :user_id, :priority)
    end
end
