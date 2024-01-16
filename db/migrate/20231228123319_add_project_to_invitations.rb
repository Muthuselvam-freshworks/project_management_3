class AddProjectToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_reference :invitations, :project, foreign_key: true
  end
end
