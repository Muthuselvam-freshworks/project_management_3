class Todo < ApplicationRecord
  belongs_to :project
  belongs_to :created_user, class_name: 'User', foreign_key: 'created_user_id'
end
