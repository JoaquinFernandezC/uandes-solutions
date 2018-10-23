class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :estimated_end_date, presence: true
  validates :privacy, presence: true
  validates :priority, presence: true
  validates :state, presence: true



  has_one :project_task, dependent:  :destroy
  has_one :project, through: :project_task
  has_one :task_goal, dependent:  :destroy
  has_one :goal, through: :task_goal
  has_one :iic_task, dependent:  :destroy
  has_one :iic, through: :iic_task
  has_one :cc_task, dependent:  :destroy
  has_one :case_coordination, through: :cc_task
  has_one :case_task,  dependent:  :destroy
  has_one :cause, through: :case_task
  has_one :derivation_task, dependent:  :destroy
  has_one :derivation, through: :derivation_task
  has_many :commentaries
  has_many :commenters, through: :commentaries, source: :users
  has_many :task_documents, dependent:  :destroy
  has_many :documents, through: :task_documents
  accepts_nested_attributes_for :documents
  validate :estimated_end_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past

  before_save :set_defaults
  def get_theme
    if !self.cause.nil?
      return self.cause
    elsif !self.iic.nil?
      return self.iic
    elsif !self.goal.nil?
      return self.goal
    elsif !self.project.nil?
      return self.project
    elsif !self.derivation.nil?
      return self.derivation
    elsif !self.case_coordination.nil?
      return self.case_coordination
    else
      return nil
    end
  end
  def set_defaults
    if self.needs_checking.nil?
      self.needs_checking= false

    end

    if self.state==0 or self.state.nil?
      self.state=Status.first.tag
    end

    if self.privacy==0 or self.privacy.nil?
      self.privacy=1
    end

    if self.log_id==0 or self.log_id.nil?
      log=Log.create()
      self.log_id=log.id
    end
  end

  @@priority = { 1 => 'Baja', 2 => 'Media', 3 => 'Alta', 3 => 'Urgente'}
  def self.priority
    @@priority
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

  def documents_attributes=(documents_attributes)
    documents_attributes.values.each do |document_attribute|
      document = Document.new(document_attribute)
      if !document.errors.any? and document.file.attached?
        document.save
        self.documents << document
      else
        puts document.errors
      end

    end
  end
end
