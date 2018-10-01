class CaseTask < ApplicationRecord
  belongs_to :task
  belongs_to :cause
end
