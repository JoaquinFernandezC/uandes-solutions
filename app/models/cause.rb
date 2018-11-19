class Cause < ApplicationRecord
  belongs_to :regional_pros_office
  belongs_to :ruc
  belongs_to :prosecutor
  
  has_many :case_tasks, dependent:  :destroy
  has_many :tasks, through: :case_tasks, dependent:  :destroy
  has_many :case_documents, dependent:  :destroy
  has_many :documents, through: :case_documents, dependent:  :destroy

  has_and_belongs_to_many :users
  has_and_belongs_to_many :people
  has_and_belongs_to_many :legal_people

  def self.NAME
    'case'
  end

end
