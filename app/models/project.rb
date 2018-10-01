class Project < ApplicationRecord
  has_many :project_documents
  has_many :documents, through: :project_documents
  has_one :project_institution
  has_one :institution, through: :project_institution
  has_many :project_responsables
  has_many :employees, through: :project_responsables
  has_many :project_stages
  has_many :project_users
  has_many :users, through: :project_users

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
