class Felony < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :ruc_felonies
  has_many :rucs, through: :ruc_felonies
end
