class LogEntry < ApplicationRecord
  belongs_to :log
  belongs_to :user

  validates :privacy, presence: true
  validates :message, presence: true
end
