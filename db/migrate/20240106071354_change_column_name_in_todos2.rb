class ChangeColumnNameInTodos2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :todos, :todo, :name
  end
end
