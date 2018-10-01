class ReportReceiverUlddeco < ApplicationRecord
  belongs_to :derivation
  belongs_to :user

  validates :derivation_id, presence: true
  validates :user_id, presence: true
end
