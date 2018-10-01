class CcDocument < ApplicationRecord
  belongs_to :document
  belongs_to :case_coordination
end
