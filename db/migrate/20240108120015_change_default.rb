class ChangeDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tasks, :status, 'Todo'
  end
end
