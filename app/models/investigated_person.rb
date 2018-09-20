class InvestigatedPerson < ApplicationRecord
  belongs_to :person
  belongs_to :case
end
