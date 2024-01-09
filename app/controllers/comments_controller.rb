class CommentsController < ApplicationController
  before_action :set_project
  before_action :set_task
  before_action :set_comment, only: [:edit, :update, :destroy]

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

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    render partial: 'comments/edit_form', locals: { comment: @comment }
  end

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

  def destroy
    @comment.destroy
    redirect_to project_tasks_path(@project), notice: 'Comment was successfully destroyed.'
  end

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

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, project_id: params[:project_id], task_id: params[:task_id],id: params[:id])
  end
end
