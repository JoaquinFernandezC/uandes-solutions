class InvestigatedPerson < ApplicationRecord
  belongs_to :person
  belongs_to :cause
  validates :person_id, presence: true
  validates :cause_id, presence: true
end
