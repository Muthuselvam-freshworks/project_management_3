class DashboardController < ApplicationController
  before_action :authenticate_user!
    def index
        @user = current_user
        @projects_created_by_user = current_user.projects
    @projects_joined_by_user = current_user.joined_projects
    @all_projects = (@projects_created_by_user + @projects_joined_by_user).uniq
      end

      def delete_selected
        task_ids = params[:task_ids]
        puts task_ids
        DeleteTasksWorker.perform_async(task_ids) if task_ids.present?
        head :no_content
      end
end
