class Project < ApplicationRecord

    #having user id in project
    belongs_to :created_user, class_name: 'User'
    #making association between user and project
    has_and_belongs_to_many :users
    #validation for name
    validates :project_name, presence: true, length: { maximum: 255 }
    #validation for description
    validates :description, presence: true
    #having many invitation for project
    has_many :invitations
    #having many task and dependent destory (trigger while deleting tasks)
    has_many :tasks, dependent: :destroy
    #checking status
    def completed?
      status == 'Completed'
    end
    #ensuring is that project is belongs to current user
    def belongs_to_current_user?(current_user)
      created_user == current_user
    end

end
