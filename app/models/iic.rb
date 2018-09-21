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
  #has_many :manager_iics
  #has_many :users, through: :manager_iics
  has_many :member_iics
  has_many :employees, through: :member_iics
  has_many :task_iics
  has_many :tasks, through: :task_iics
end
