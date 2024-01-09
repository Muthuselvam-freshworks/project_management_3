class DashboardController < ApplicationController
  before_action :authenticate_user!
    def index
        @user = current_user
        @projects_created_by_user = current_user.projects
    @projects_joined_by_user = current_user.joined_projects
    @all_projects = (@projects_created_by_user + @projects_joined_by_user).uniq
    @tasks_count_assigned_to_me = Task.where(user_id: current_user.id).count
    @tasks_count_overdue_assigned_to_me = Task.where(user_id: current_user.id).where('due_date < ?', Date.today).count
      end

      def delete_selected
        task_ids = params[:task_ids]
        DeleteTasksWorker.perform_async(task_ids) if task_ids.present?
        head :no_content
      end

      def search

        created_projects = current_user.projects.where("project_name LIKE ?", "%#{params[:query]}%")
        joined_projects = current_user.joined_projects.where("project_name LIKE ?", "%#{params[:query]}%")
      
        all_projects = {
          created_projects: created_projects.as_json,
          joined_projects: joined_projects.as_json
        }
      
        render json: all_projects
      end
      
end
