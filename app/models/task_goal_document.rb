class TaskGoalDocument < ApplicationRecord
  belongs_to :task_goal
  belongs_to :document
end
