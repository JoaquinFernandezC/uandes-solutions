class ProjectTask < ApplicationRecord
  belongs_to :project
  belongs_to :task

  validates :project_id, presence: true
  validates :task_id, presence: true

  has_many :project_task_documents
  has_many :documents, through: :project_task_documents
end
