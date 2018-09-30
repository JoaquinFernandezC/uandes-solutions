class CaseCoordination < ApplicationRecord
  has_many :cc_assignations
  has_many :users, :through => :cc_assignations
  has_many :cc_documents
  has_many :documents, :through => :cc_documents
  has_many :cc_inv_leg_persons
  has_many :legal_persons, :through => :cc_inv_leg_persons
  has_many :cc_inv_persons
  has_many :people, :through => :cc_inv_persons
  has_many :cc_regions
  has_many :regional_pros_offices, :through => :cc_regions
  has_many :cc_rucs
  has_many :rucs, :through => :cc_rucs

  
  validates :name, presence: true 
  validate :estimated_end_date_cannot_be_in_the_past

  def estimated_end_date_cannot_be_in_the_past
    if estimated_end_date.present? && estimated_end_date < Date.today
      errors.add(:estimated_end_date, "can't be in the past")
    end
  end 
end
