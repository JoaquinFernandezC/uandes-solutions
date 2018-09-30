class ProjectStage < ApplicationRecord
  belongs_to :project

  validates :project_id, presence: true
  validates :stage_number, presence: true
  validates :description, presence: true

  has_many :project_stage_users
  has_many :users, through: :project_stage_users
end
