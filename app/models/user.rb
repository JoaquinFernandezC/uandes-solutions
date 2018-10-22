class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :case_assignations
  has_many :assigned_cases, through: :case_assignations, source: :causes
  has_many :assigned_to_goals
  has_many :goals, :through => :assigned_to_goals
  has_many :cc_assignations
  has_many :case_coordinations, :through => :cc_assignations
  has_many :commentaries
  has_many :commented_tasks, through: :commentaries, source: :tasks
  has_many :derivation_assignations
  has_many :derivations, :through => :derivation_assignations
  has_many :internal_authors
  has_many :documents, :through => :internal_authors
  has_and_belongs_to_many :iic_management, class_name: 'Iic', join_table: 'iics_managers', foreign_key: 'user_id'
  has_and_belongs_to_many :iic_internal_membership, class_name: 'Iic', join_table: 'iics_internal_members', foreign_key: 'user_id'
  has_many :project_stage_users
  has_many :project_stage, :through => :project_stage_users
  has_many :project_users
  has_many :projects, :through => :project_users
  has_many :report_receiver_ulddecos
  has_many :derivations, :through => :report_receiver_ulddecos
  has_many :internal_authors
  has_many :publications, through: :internal_authors, source: :document
  has_many :log_entries

  validates :email, presence: true, uniqueness: true
  validates :rut, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, presence: true
  validates :rol, presence: true
  #validates_format_of :rut, with: /\A\d{1,2,3}\.\d{3}\.\d{3}[-][0-9kK]{1}$\z/i, on: :create

  def name
    "#{try(:first_name)} #{try(:last_name)}".to_s
  end
end
