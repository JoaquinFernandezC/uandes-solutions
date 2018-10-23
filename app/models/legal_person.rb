class LegalPerson < ApplicationRecord
  validates :name, presence: true
  validates :rut, presence: true, uniqueness: true
  
  has_and_belongs_to_many :causes
  has_and_belongs_to_many :case_coordinations
end
