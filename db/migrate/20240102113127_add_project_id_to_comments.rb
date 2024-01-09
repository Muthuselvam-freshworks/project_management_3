class AddProjectIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :project_id, :integer
  end
end
