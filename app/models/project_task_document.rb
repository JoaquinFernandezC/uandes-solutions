class ProjectTaskDocument < ApplicationRecord
  belongs_to :document
  belongs_to :project_task
end
