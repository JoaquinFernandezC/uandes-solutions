class ReportReceiverPerson < ApplicationRecord
  belongs_to :derivation
  belongs_to :people
end
