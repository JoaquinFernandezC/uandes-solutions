class ProjectInstitution < ApplicationRecord
  belongs_to :institution
  belongs_to :project

  validates :institution_id, presence: true
  validates :project_id, presence: true
end
