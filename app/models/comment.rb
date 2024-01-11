class Comment < ApplicationRecord

  #belongs to user (comment will have user id)
  belongs_to :user
  #belongs to task (comment will have task id)
  belongs_to :task
  #validation
  validates :body, presence: true
  validates :project_id, presence: true

end
