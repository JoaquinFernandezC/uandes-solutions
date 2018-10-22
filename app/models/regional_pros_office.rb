class RegionalProsOffice < ApplicationRecord
  belongs_to :prosecutor

  has_and_belongs_to_many :case_coordinations

  validates :region, presence: true
  validates :prosecutor_id, presence: true
end
