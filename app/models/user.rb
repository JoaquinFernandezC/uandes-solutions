class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :assigned_to_goals
  has_many :goals, :through => :assigned_to_goals
  has_many :cc_assignations
  has_many :case_coordinations, :through => :cc_assignations
  has_many :commentaries
  has_many :derivation_assignations
  has_many :derivations, :through => :derivation_assignations
  has_many :internal_authors
  has_many :documents, :through => :internal_authors
  has_one :internal_member_iic
  has_one :iic, :through => :internal_member_iics
  has_one :manager_iic
  has_one :iic, :through => :manager_iics
  has_many :project_stage_users
  has_many :project_stage, :through => :project_stage_users
  has_many :project_users
  has_many :projects, :through => :project_users
  has_many :report_receiver_ulddecos
  has_many :derivations, :through => :report_receiver_ulddecos
end
