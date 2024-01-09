class TasksController < ApplicationController
    before_action :set_project
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :update_all_background_colors, only: [:index]
  
    def index
      @tasks = @project.tasks
      @project = Project.find(params[:project_id])
      @task = @project.tasks.build
      @users = User.all
      @comments = @task.comments.order(created_at: :desc)
      @assignable_users = assignable_users
      @comment = Comment.new
    end
  
    
      def show
        @comment_task = Task.find(params[:id])
        @comments = @task.comments.order(created_at: :desc)
        @new_comment = Comment.new
        render json: @comments
      end
  

      def create_comment
        @task = Task.find(params[:id])
        @comment = @task.comments.build(comment_params)
        @comment.user = current_user
    
        if @comment.save
          redirect_to task_path(@task), notice: 'Comment added successfully.'
        else
          flash[:alert] = 'Failed to add comment.'
          render :show
        end
      end

      def create
        @project = Project.find(params[:project_id])
      @task = @project.tasks.build(task_params)
  
      if @task.save
        redirect_to project_tasks_path(@project), notice: 'Task was successfully created.'
      else
        render :new
      end
    end

    def assignable_users
      if @project.belongs_to_current_user?(current_user)
        @project.users + [current_user]
      else
        @project.users
      end
    end

    def calendar 

    end
  
    def new
      @task = @project.tasks.build
      @users = User.all
    end
   

    
   
  
    def edit
        @users = User.all
       @task = Task.find(params[:id])
    end
  
    def update
      if @task.update(task_params)
        redirect_to project_tasks_path(@project), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to project_tasks_path(@project), notice: 'Task was successfully destroyed.'
    end
  
    def search
      @tasks = Task.where('name LIKE ?', "%#{params[:query]}%")

      respond_to do |format|
        format.html { render :index } # Render the index view for HTML requests
        format.json { render json: @tasks } # Render the search results as JSON for AJAX requests
      end
    end
    
    
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
    if params[:id] == 'search'
      @tasks = Task.where('name LIKE ?', "%#{params[:query]}%")
    else
      @task = Task.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Task not found."
    redirect_to project_tasks_path(@project)
  end

    def task_params
      params.require(:task).permit(:name, :description, :start_date, :due_date, :user_id, :priority)
    end
end
