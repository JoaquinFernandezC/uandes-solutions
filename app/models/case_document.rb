class CaseDocument < ApplicationRecord
  belongs_to :document
  belongs_to :case
end
