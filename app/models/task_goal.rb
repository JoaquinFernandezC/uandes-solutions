class TaskGoal < ApplicationRecord
  belongs_to :goal
  belongs_to :task
end
