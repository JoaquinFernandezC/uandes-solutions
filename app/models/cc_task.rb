class CcTask < ApplicationRecord
  belongs_to :case_coordination
  belongs_to :task
  has_many :cc_task_documents
  has_many :documents, :through => :cc_task_documents
end
