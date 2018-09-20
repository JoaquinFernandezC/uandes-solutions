class GoalDocument < ApplicationRecord
  belongs_to :goal
  belongs_to :document
end
