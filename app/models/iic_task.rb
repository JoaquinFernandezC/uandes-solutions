class IicTask < ApplicationRecord
  belongs_to :iic
  belongs_to :task

  validates :iic_id, presence: true
  validates :task_id, presence: true
end
