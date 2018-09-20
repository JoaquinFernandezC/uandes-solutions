class CcInvPerson < ApplicationRecord
  belongs_to :person
  belongs_to :case_coordination
end
