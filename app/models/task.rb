class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :estimated_end_date, presence: true
  validates :privacy, presence: true
  validates :priority, presence: true
  validates :state, presence: true



  has_one :project_task
  has_one :project, through: :project_task
  has_one :task_goal
  has_one :goal, through: :task_goal
  has_one :iic_task, dependent:  :destroy
  has_one :iic, through: :iic_task
  has_one :cc_task
  has_one :case_coordination, through: :cc_tasks
  has_one :case_task
  has_one :cause, through: :case_task
  has_one :derivation_task
  has_one :derivation, through: :derivation_task
  has_many :commentaries
  has_many :commenters, through: :commentaries, source: :users
  validate :estimated_end_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past

  before_save :set_defaults

  def get_theme
    puts self.iic_task
    if !self.cause.nil?
      return theme
    elsif !self.iic.nil?
      return self.iic
    else
      return nil
    end
  end
  def set_defaults
    if self.needs_checking.nil?
      self.needs_checking= false

    end
    puts "hola"
    puts self.needs_checking
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
end
