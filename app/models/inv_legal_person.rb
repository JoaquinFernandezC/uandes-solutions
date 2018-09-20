class InvLegalPerson < ApplicationRecord
  belongs_to :legal_person
  belongs_to :case
end
