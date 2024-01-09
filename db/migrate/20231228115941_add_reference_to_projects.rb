class AddReferenceToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :created_user, foreign_key: { to_table: :users }
  end
end
