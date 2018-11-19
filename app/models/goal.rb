class Goal < ApplicationRecord
  validates :year, presence: true
  validates :goal_number, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :estimated_end_date, presence: true
  validates :privacy, presence: true

  has_and_belongs_to_many :users, association_foreign_key: 'user_id', join_table: 'assigned_to_goals', class_name: 'User'
  has_and_belongs_to_many :involved_users, association_foreign_key: 'user_id', join_table: 'goal_users', class_name: 'User'

  has_many :goal_documents
  has_many :documents, through: :goal_documents

  has_many :task_goals, dependent:  :destroy
  has_many :tasks, through: :task_goals, dependent:  :destroy

  def self.NAME
    'goal'
  end

end
