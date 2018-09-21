class DocumentTaskIic < ApplicationRecord
  belongs_to :task_iic
  belongs_to :document

  validates :task_iic_id, presence: true
  validates :document_id, presence: true
end
