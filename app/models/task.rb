class Task < ApplicationRecord
    belongs_to :project
    validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :start_date, presence: true
  validates :due_date, presence: true
  validates :user_id, presence: true
  validates :priority, inclusion: { in: ['high', 'medium', 'low'] }
  belongs_to :assigned_user, class_name: 'User', foreign_key: 'user_id', optional: true
  has_many :comments, dependent: :destroy

  def update_background_color
    if due_date.nil?
      update(background_color: 'gray') # or any default color
    elsif due_date <= Date.today
      update(background_color: 'red')
    elsif due_date <= 2.days.from_now.to_date
      update(background_color: 'yellow')
    else
      update(background_color: 'green')
    end
  end
end
