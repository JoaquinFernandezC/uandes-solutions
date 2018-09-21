class Petitioner < ApplicationRecord
  belongs_to :person

  validates :person_id, presence: true
  validates :position, presence: true
  validates :location, presence: true
end
