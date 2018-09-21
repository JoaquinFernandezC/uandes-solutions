class CaseTask < ApplicationRecord
  belongs_to :task
  belongs_to :case
  has_many :case_task_documents
  has_many :documents, :through => :case_task_documents
end
