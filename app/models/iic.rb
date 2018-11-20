class Iic < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :estimated_end_date, presence: true
  validates :privacy, presence: true

  has_many :iic_documents, dependent: :destroy
  has_many :documents, through: :iic_documents
  accepts_nested_attributes_for :documents, allow_destroy: true
  has_and_belongs_to_many :managers, association_foreign_key: 'user_id', join_table: 'iics_managers', class_name: 'User'
  has_and_belongs_to_many :internal_members, association_foreign_key: 'user_id', join_table: 'iics_internal_members', class_name: 'User'
  has_and_belongs_to_many :external_members, class_name: 'Employee'
  has_many :iic_tasks, dependent:  :destroy
  has_many :tasks, through: :iic_tasks, dependent:  :destroy
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
      unless document_attribute[:file].nil?
        document = Document.new(document_attribute)
        document.classification = privacy
        document.docType = 'Entrance'
        log = Log.new
        log.save
        user = document_attribute[:user_id]
        document.log_id = log.id
        document.save
        self.documents << document
        log_message = 'Se añadió el documento "' + document.name + '" a la coordinación insterinstitucional "' + name + '".'
        entry = LogEntry.new(log_id: log.id, user_id: user, privacy: privacy, message: log_message)
        entry.save
      end
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
