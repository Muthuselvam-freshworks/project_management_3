class Invitation < ApplicationRecord
  #makes getter and setter 
  attr_accessor :receiver_email
  #having project id
  belongs_to :project
  #used to filter invitation by pending so using scope
  scope :pending, -> { where(status: 'pending') }
  #validating user email before creating
  before_validation :find_user_by_email, on: :create
  #having sender as user id
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  #having receiver as user id
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  private

  def find_user_by_email
    self.receiver = User.find_by_email(receiver_email)
  end

  

end
