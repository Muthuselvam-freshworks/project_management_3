class AddStatusToProjects < ActiveRecord::Migration[5.2]
  def change
    change_column_default :projects, :status, from: nil, to: 'Pending'
  end
end
