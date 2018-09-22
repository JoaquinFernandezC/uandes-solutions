class Prosecutor < ApplicationRecord
	validates :rut, uniqueness: true
end
