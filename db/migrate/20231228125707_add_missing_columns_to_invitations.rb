class AddMissingColumnsToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_reference :invitations, :sender, foreign_key: { to_table: :users }
    add_reference :invitations, :receiver, foreign_key: { to_table: :users }
    add_column :invitations, :status, :string
  end
end
