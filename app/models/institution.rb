class Institution < ApplicationRecord
  validates :name, presence: true

  has_many :employees
  has_many :people, through: :employees
  has_many :project_institutions
  has_many :projets, through: :project_institutions
end
