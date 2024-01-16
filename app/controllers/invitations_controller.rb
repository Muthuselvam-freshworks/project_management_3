class InvitationsController < ApplicationController
    #ensuring whether the user is present or not
    before_action :authenticate_user! 
    
    #index method to get the received invitations where status is pending
    def index
      @invitations = current_user.received_invitations.where.not(sender_id: current_user.id).where(status: 'pending')
    end

    #method to display new invitation form and creating a invitation obj in specified project
    def new
      @project = Project.find(params[:project_id])
      @invitation = Invitation.new
    end

    #handling the submission for new invitation
    def create
      @project = Project.find(params[:project_id])
      @invitation = Invitation.new(invitation_params)
      @invitation.sender = current_user
      @invitation.project = @project
      @invitation.status = 'pending'
      if @invitation.save
        redirect_to project_path(@project), notice: 'Invitation sent successfully.'
      else
        puts @invitation.errors.full_messages.inspect
        render 'projects/show'
      end
    end

    #accepting invitation by receiver
    def accept
      @invitation = Invitation.find(params[:id])
      if @invitation.update(status: 'accepted')
        #adding the invitation project to joined projects (concat)
        @invitation.receiver.joined_projects << @invitation.project
        redirect_to dashboard_path, notice: 'Invitation accepted.'
      else
        #console errors
        puts @invitation.errors.full_messages.inspect
        redirect_to dashboard_path, alert: 'Error accepting invitation.'
      end
    end
    
    #reject invitation by receiver
    def reject
      @invitation = Invitation.find(params[:id])
      @invitation.update(status: 'rejected')
      redirect_to dashboard_path, notice: 'Invitation rejected.'
    end

    private

    def invitation_params
        params.require(:invitation).permit(:receiver_email)
    end

    def set_project
        @project = Project.find(params[:project_id])
    end 

end
