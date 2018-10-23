class Ruc < ApplicationRecord
  validates :number, presence: true

  has_and_belongs_to_many :case_coordinations
  has_and_belongs_to_many :felonies
end
