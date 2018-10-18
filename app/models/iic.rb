class Iic < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  #validates :state, presence: true
  validates :start_date, presence: true
  #validates :estimated_end_date, presence: true
  validates :end_date, presence: true
  #validates :privacy, presence: true
  validates :multilateral, presence: true

  has_many :iic_documents
  has_many :documents, through: :iic_documents
  has_many :iic_internal_members
  has_many :internal_members, through: :iic_internal_members, source: :users
  has_many :iic_managers
  has_many :managers, through: :iic_managers, source: :users
  has_many :iic_members
  has_many :external_members, through: :iic_members, source: :users
  has_many :iic_tasks
  has_many :tasks, through: :iic_tasks


  validate :estimated_end_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past

  def estimated_end_date_cannot_be_in_the_past
    if estimated_end_date.present? && estimated_end_date < Date.today
      errors.add(:estimated_end_date, "can't be in the past")
    end
  end
  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end 
end
