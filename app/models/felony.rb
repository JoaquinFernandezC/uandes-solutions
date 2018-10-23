class Felony < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :rucs
end
