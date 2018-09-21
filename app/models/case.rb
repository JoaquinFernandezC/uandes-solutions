class Case < ApplicationRecord
  belongs_to :regional_pros_office
  belongs_to :ruc_felony
  belongs_to :prosecutor
  has_one :ruc
  has_one :regional_pros_office
  has_many :case_documents
  has_many :documents, :through => :case_documents
  has_many :case_tasks
  has_many :inv_legal_persons
  has_many :legal_persons, :through => :inv_legal_persons
  has_many :investigated_persons
  has_many :people, :through => :investigated_persons
end
