class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :todo
      t.string :tags
      t.date :due_date
      t.references :project, null: false, foreign_key: true
      t.references :created_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
