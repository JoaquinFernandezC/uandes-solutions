class Employee < ApplicationRecord
  belongs_to :person
  belongs_to :institution

  validates :person_id, presence: true
  validates :institution_id, presence: true
  validates :position, presence: true

  has_and_belongs_to_many :iics

  has_many :project_responsables
  has_many :projets, through: :project_responsables

  def info
    '(' + institution.name + ') ' + person.name
  end
end
