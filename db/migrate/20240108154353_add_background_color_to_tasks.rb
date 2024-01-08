class AddBackgroundColorToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :background_color, :string
  end
end
