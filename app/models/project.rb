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
end
