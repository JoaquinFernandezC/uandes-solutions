class CaseCoordination < ApplicationRecord
  has_many :cc_documents
  has_many :documents, :through => :cc_documents
  has_many :cc_regions
  has_many :regional_pros_offices, :through => :cc_regions

  has_and_belongs_to_many :users
  has_and_belongs_to_many :rucs
  has_and_belongs_to_many :people
  has_and_belongs_to_many :legal_people
  has_and_belongs_to_many :prosecutors
  has_and_belongs_to_many :regional_pros_offices

  has_many :cc_tasks
  has_many :tasks, through: :cc_tasks

  validates :name, presence: true 
  validate :estimated_end_date_cannot_be_in_the_past

  def estimated_end_date_cannot_be_in_the_past
    if estimated_end_date.present? && estimated_end_date < Date.today
      errors.add(:estimated_end_date, "can't be in the past")
    end
  end

  def self.NAME
    'cc'
  end

end
