class Cause < ApplicationRecord
  belongs_to :regional_pros_office
  belongs_to :ruc
  belongs_to :prosecutor
  
  has_many :case_tasks
  has_many :tasks, through: :case_tasks
  has_many :case_documents
  has_many :documents, through: :case_documents

  has_and_belongs_to_many :users
  has_and_belongs_to_many :people
  has_and_belongs_to_many :legal_people
end
