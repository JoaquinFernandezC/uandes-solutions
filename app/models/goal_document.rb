class GoalDocument < ApplicationRecord
  belongs_to :goal
  belongs_to :document

  validates :goal_id, presence: true
  validates :document_id, presence: true
end
