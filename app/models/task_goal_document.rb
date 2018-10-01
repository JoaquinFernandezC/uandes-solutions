class TaskGoalDocument < ApplicationRecord
  belongs_to :task_goal
  belongs_to :document

  validates :task_goal_id, presence: true
  validates :document_id, presence: true
end
