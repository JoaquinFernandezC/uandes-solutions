class Project < ApplicationRecord
  has_many :project_documents
  has_many :documents, through: :project_documents
  has_one :project_institution
  has_one :institution, through: :project_institution
  has_and_belongs_to_many :employees, class_name: 'Employee', association_foreign_key: 'employee_id', join_table: 'project_responsables'
  has_and_belongs_to_many :users, class_name: 'User', association_foreign_key: 'user_id', join_table: 'project_users'
  has_many :project_stages
  has_many :project_tasks
  has_many :tasks, through: :project_tasks


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

  def self.NAME
    'project'
  end

end
