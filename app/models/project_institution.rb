class ProjectInstitution < ApplicationRecord
  belongs_to :institution
  belongs_to :project
end
