class ErrorLog < ApplicationRecord
  validates :code, presence: true
  validates :privacy, presence: true
  validates :action, presence: true
end
