class CaseTaskDocument < ApplicationRecord
  belongs_to :case_task
  belongs_to :document
end
