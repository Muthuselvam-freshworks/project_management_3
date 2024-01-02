class AddStartDateToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :start_date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
