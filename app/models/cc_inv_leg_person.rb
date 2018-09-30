class CcInvLegPerson < ApplicationRecord
  belongs_to :legal_person
  belongs_to :case_coordination
end
