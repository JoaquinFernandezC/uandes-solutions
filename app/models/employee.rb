class Employee < ApplicationRecord
  belongs_to :person
  belongs_to :institution

  validates :person_id, presence: true
  validates :institution_id, presence: true
  validates :position, presence: true

  has_one :iic_member
  has_one :icc, through: :member_iic

  has_many :project_responsables
  has_many :projets, through: :project_responsables
end
