class Prosecutor < ApplicationRecord
  validates :rut, uniqueness: true

  has_and_belongs_to_many :case_coordinations
  has_one :regional_pros_office
end
