class ProjectStageUser < ApplicationRecord
  belongs_to :user
  belongs_to :project_stage
end
