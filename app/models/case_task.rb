class CaseTask < ApplicationRecord
  belongs_to :task
  has_many :case_task_documents
  has_many :documents, :through => :case_task_documents
  belongs_to :cause
end
