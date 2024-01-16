class CommentsController < ApplicationController
  #setting a project by getting project id from params
  before_action :set_project
  #setting a task by getting task id from params
  before_action :set_task
  #setting a comments by getting comment id from params only for specified actions
  before_action :set_comment, only: [:edit, :update, :destroy]

  #create a comment in specific task
  def create
    @comment = @task.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
      redirect_to project_task_path(@project, @task)
      else
      puts @comment.errors.full_messages
      end
    end
  end

  #rendering a edit comment page by getting a comment id from params 
  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    #render a edit form to edit a comment
    render partial: 'comments/edit_form', locals: { comment: @comment }
  end

  #update a comment when pressing submit button in edit page of comment
  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to project_tasks_path(@project), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  #to delete the comment 
  def destroy
    @comment.destroy
    redirect_to project_tasks_path(@project), notice: 'Comment was successfully destroyed.'
  end

  #private method for setting up the before action things
  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:task_id])
  end

  def set_comment
    @comment = @task.comments.find(params[:id])
  end

  #permitting the params to allow for comment
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, project_id: params[:project_id], task_id: params[:task_id],id: params[:id])
  end

end
