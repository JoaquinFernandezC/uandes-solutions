class Goal < ApplicationRecord
  validates :year, presence: true
  validates :goal_number, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :estimated_end_date, presence: true
  validates :end_date, presence: true
  validates :privacy, presence: true
  validates :log, presence: true

  has_many :assigned_to_goals
  has_many :users, through: :assigned_to_goals

  has_many :goal_documents
  has_many :documents, through: :goal_documents

  has_many :task_goals
  has_many :tasks, through: :task_goals
end
