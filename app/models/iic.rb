class Iic < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :estimated_end_date, presence: true
  validates :end_date, presence: true
  validates :privacy, presence: true

  has_many :iic_documents
  has_many :documents, through: :iic_documents
  accepts_nested_attributes_for :documents
  has_and_belongs_to_many :managers, association_foreign_key: 'user_id', join_table: 'iics_managers', class_name: 'User'
  has_and_belongs_to_many :internal_members, association_foreign_key: 'user_id', join_table: 'iics_internal_members', class_name: 'User'
  has_and_belongs_to_many :external_members, class_name: 'Employee'
  has_many :iic_tasks
  has_many :tasks, through: :iic_tasks
  has_one :log
  has_many :log_entries, through: :log

  validate :estimated_end_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past
  validate :check_multilateral

  def self.NAME
    'iic'
  end
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
  def all_managers
    (self.managers).uniq
  end

  def documents_attributes=(documents_attributes)
    documents_attributes.values.each do |document_attribute|
      document = Document.new(document_attribute)
      document.save
      self.documents << document
    end
  end

  def check_multilateral
    unless :multilateral
      institutions = []
      :external_members.each do |employee|
        if institutions.include?(employee.institution.name)
          errors.add(:internal_members, 'have to be from the same institution')
        else
          institutions.append(employee.institution.name)
        end
      end
    end
  end
end
