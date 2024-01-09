class RenameNameToProjectNameInProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :name, :project_name
  end
end
