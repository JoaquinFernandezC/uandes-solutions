class ProjectStageUser < ApplicationRecord
  belongs_to :user
  belongs_to :project_stage

  validates :user_id, presence: true
  validates :project_stage_id, presence: true
end
