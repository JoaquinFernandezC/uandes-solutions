class DerivationTask < ApplicationRecord
  belongs_to :derivation
  belongs_to :task
  has_many :derivation_task_documents
  has_many :documents, :through => :derivation_task_documents
end
