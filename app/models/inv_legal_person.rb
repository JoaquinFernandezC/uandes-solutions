class InvLegalPerson < ApplicationRecord
  belongs_to :legal_person
  belongs_to :case

  validates :legal_person_id, presence: true
  validates :case_id, presence: true
end
