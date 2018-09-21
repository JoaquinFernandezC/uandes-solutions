class ReportReceiverPerson < ApplicationRecord
  belongs_to :derivation
  belongs_to :person

  validates :derivation_id, presence: true
  validates :person_id, presence: true
end
