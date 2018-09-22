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

  validate :estimated_end_date_cannot_be_in_the_past

  def estimated_end_date_cannot_be_in_the_past
    if estimated_end_date.present? && estimated_end_date < Date.today
      errors.add(:estimated_end_date, "can't be in the past")
    end
  end  
end
