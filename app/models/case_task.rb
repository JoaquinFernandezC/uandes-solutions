class CaseTask < ApplicationRecord
  belongs_to :task, dependent: :destroy
  belongs_to :cause
end
