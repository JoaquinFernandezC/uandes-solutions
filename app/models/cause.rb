class Cause < ApplicationRecord
  belongs_to :regional_pros_office
  belongs_to :ruc
  belongs_to :prosecutor
  has_many :case_assignations
  has_many :assigned_users, through: :case_assignations, source: :users
  has_many :case_tasks
  has_many :tasks, through: :case_tasks
  has_many :case_documents
  has_many :documents, through: :case_documents
  has_many :inv_legal_people
  has_many :legal_people, through: :inv_legal_people
  has_many :investigated_people
  has_many :people, through: :investigated_people
end
