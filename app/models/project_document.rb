class ProjectDocument < ApplicationRecord
  belongs_to :project
  belongs_to :document

  validates :project_id, presence: true
  validates :document_id, presence: true
end
