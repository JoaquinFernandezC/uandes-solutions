class Document < ApplicationRecord
  has_one_attached :file
  has_many :authors
  has_many :people, :through => :authors
  has_many :internal_authors
  has_many :users, :through => :internal_authors
  has_one :case_document
  has_one :case, :through => :case_document
  has_one :case_task_document
  has_one :case_task, :through => :case_task_document
  has_one :cc_document
  has_one :case_coordination, :through => :cc_document
  has_one :cc_task_document
  has_one :cc_task, :through => :cc_task_documents
  has_one :derivation_document
  has_one :derivation, :through => :derivation_documents
  has_one :derivation_task_document
  has_one :derivation_task, :through => :derivation_task_document
  has_one :documents_iic
  has_one :iic, :through => :documents_iics
  has_one :documents_task_iic
  has_one :task_iic, :through => :documents_task_iics
  has_one :goal_document
  has_one :goal, :through => :goal_documents
  has_one :project_document
  has_one :project, :through => :project_documents
  has_one :project_task_document
  has_one :project_task, :through => :project_task_documents
  has_one :task_goal_document
  has_one :task_goal, :through => :task_goal_documents

  validates :name, presence: true
  validates :classification, presence: true
  validates :type, presence: true
  validates :version, presence: true
end
