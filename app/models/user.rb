class User < ApplicationRecord
  
  #devise validations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  #validations
  validates :email, presence: true, uniqueness: true, length: { minimum: 3, maximum: 48 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 3, maximum: 28 }
  validates :password_confirmation, presence: true, length: { minimum: 3, maximum: 28 }
  #having many invitations 
  has_many :sent_invitations, class_name: 'Invitation', foreign_key: 'sender_id'
  has_many :received_invitations, class_name: 'Invitation', foreign_key: 'receiver_id'
  #having many projects
  has_many :projects, foreign_key: 'created_user_id'
  #making associations between users and projects
  has_and_belongs_to_many :joined_projects, class_name: 'Project', join_table: 'projects_users'
  #getting all the invitations
  def invitations
    sent_invitations + received_invitations
  end
  
end
