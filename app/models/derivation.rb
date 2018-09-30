class Derivation < ApplicationRecord
  belongs_to :petitioner
  has_many :derivations_assignations
  has_many :users, :through => :derivations_assignations
  has_many :derivations_documents
  has_many :documents, :through => :derivations_documents
  has_many :derivation_reports
  has_many :derivation_tasks
  has_many :tasks, :through => :derivation_tasks
  has_many :report_receiver_people
  has_many :people, :through => :report_receiver_people
  has_many :report_receiver_ulddecos
  has_many :users, :through => :report_receiver_ulddecos
  
  validates :name, presence: true
  validates :petitioner_id, presence: true
  validates :estimated_end_date, presence: true

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
