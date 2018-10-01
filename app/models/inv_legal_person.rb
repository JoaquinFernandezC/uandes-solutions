class InvLegalPerson < ApplicationRecord
  belongs_to :legal_person
  belongs_to :cause
  validates :legal_person_id, presence: true
  validates :cause_id, presence: true
end
