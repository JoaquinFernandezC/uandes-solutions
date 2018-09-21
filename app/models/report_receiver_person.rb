class ReportReceiverPerson < ApplicationRecord
  belongs_to :derivation
  belongs_to :person
end
