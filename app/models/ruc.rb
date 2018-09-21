class Ruc < ApplicationRecord
  validates :number, presence: true

  has_many :ruc_felonies
  has_many :felonies, through: :ruc_felonies
end
