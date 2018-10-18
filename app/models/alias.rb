class Alias < ApplicationRecord
  belongs_to :person
  validates :nickname, presence: true
end
