class Project < ApplicationRecord
    belongs_to :created_user, class_name: 'User'
    has_and_belongs_to_many :users
    validates :project_name, presence: true, length: { maximum: 255 }
    validates :description, presence: true
    has_many :invitations
    has_many :tasks, dependent: :destroy
    has_many :todos, dependent: :destroy
    def belongs_to_current_user?(current_user)
        created_user == current_user
      end
end
