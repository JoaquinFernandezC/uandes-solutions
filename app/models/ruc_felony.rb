class RucFelony < ApplicationRecord
  belongs_to :felony
  belongs_to :ruc

  validates :felony_id, presence: true
  validates :ruc_id, presence: true
end
