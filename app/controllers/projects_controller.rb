class ProjectsController < ApplicationController
  #ensuring whether the user is present or not
  before_action :authenticate_user!
   
  
  #displaying the new create form for project
  def new
    @project = current_user.projects.build
  end

  #display the project details and team members
  def show
    @project = Project.find(params[:id])
    @team_members = @project.users
    @invitation = @project.invitations.build
    @owner_email = User.find(@project.created_user_id)
  end

  #displaying the calendar
  def calendar 
    @project = Project.find(params[:id])
  end

  #create method for creating projects for specified user
  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to dashboard_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  #rendering edit form for editing the project
  def edit
    @project = Project.find(params[:id])
  end

  #handling submission in edit form of project
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  #delete method for project
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to dashboard_path, notice: 'Project was successfully deleted.'
  end

  #marking the project status
  def mark_as_complete
    @project = Project.find(params[:id])
    new_status = @project.completed? ? 'Pending' : 'Completed'
    @project.update(status: new_status)
    redirect_to project_path(@project)
  end
  private

  #allowing the params for project
  def project_params
    params.require(:project).permit(:project_name, :description)
  end

end
