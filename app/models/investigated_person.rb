class InvestigatedPerson < ApplicationRecord
  belongs_to :person
  belongs_to :case

  validates :person_id, presence: true
  validates :case_id, presence: true
end
