class ManagerIic < ApplicationRecord
  belongs_to :iic
  belongs_to :user

  validates :iic_id, presence: true
  validates :user_id, presence: true
end
