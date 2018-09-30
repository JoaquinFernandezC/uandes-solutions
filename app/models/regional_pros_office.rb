class RegionalProsOffice < ApplicationRecord
  belongs_to :prosecutor

  validates :region, presence: true
  validates :prosecutor_id, presence: true
end
