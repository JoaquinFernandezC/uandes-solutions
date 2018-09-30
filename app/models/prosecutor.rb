class Prosecutor < ApplicationRecord
	validates :rut, uniqueness: true

  has_many :cc_prosecutors
  has_many :case_coordinations, :through => :cc_prosecutors
  has_one :regional_pros_office
end
