class DocumentIic < ApplicationRecord
  belongs_to :iic
  belongs_to :document

  validates :iic_id, presence: true
  validates :document_id, presence: true
end
