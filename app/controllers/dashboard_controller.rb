class DashboardController < ApplicationController
    #ensuring the whether there is user or not
    before_action :authenticate_user!

    #method to display the counts of assigned tasks , overdue tasks and getting the own projects and joined projects
    def index
        @user = current_user
        @projects_created_by_user = current_user.projects
        @projects_joined_by_user = current_user.joined_projects
        @all_projects = (@projects_created_by_user + @projects_joined_by_user).uniq
        @active_created_projects = current_user.projects.where(status: "Pending")
        @active_joined_projects = current_user.joined_projects.where(status: "Pending")
        @all_active_projects = (@active_created_projects + @active_joined_projects).uniq
        @tasks_count_assigned_to_me = Task.where(user_id: current_user.id).count
        @tasks_count_overdue_assigned_to_me = Task.where(user_id: current_user.id).where('due_date < ?', Date.today).count
    end

    #to delete the selected tasks by sidekiq
    def delete_selected
        task_ids = params[:task_ids]
        DeleteTasksWorker.perform_async(task_ids) if task_ids.present?
        head :no_content
    end

    #seach method for searching the tasks by using query in params
    def search
        created_projects = current_user.projects.where("project_name LIKE ?", "%#{params[:query]}%")
        joined_projects = current_user.joined_projects.where("project_name LIKE ?", "%#{params[:query]}%")
        #return as objects of arrays
        all_projects = {
          created_projects: created_projects.as_json,
          joined_projects: joined_projects.as_json
        }
        #rendering as json
        render json: all_projects
    end
      
end
