class Iic < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :estimated_end_date, presence: true
  validates :end_date, presence: true
  validates :log, presence: true
  validates :privacy, presence: true
  validates :multilateral, presence: true

  has_many :document_iics
  has_many :documents, through: :document_iics
  has_many :internal_member_iics
  has_many :users, through: :internal_member_iics
  has_many :manager_iics
  has_many :managers, class_name: 'User', through: :manager_iics
  has_many :member_iics
  has_many :employees, through: :member_iics
  has_many :task_iics
  has_many :tasks, through: :task_iics


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
