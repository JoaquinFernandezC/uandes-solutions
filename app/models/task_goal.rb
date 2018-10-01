class TaskGoal < ApplicationRecord
  belongs_to :goal
  belongs_to :task

  validates :goal_id, presence: true
  validates :task_id, presence: true

  has_many :task_goal_documents
  has_many :documents, through: :task_goal_documents
end
