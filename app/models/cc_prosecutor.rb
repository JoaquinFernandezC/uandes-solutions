class CcProsecutor < ApplicationRecord
  belongs_to :case_coordination
  belongs_to :prosecutor
end
