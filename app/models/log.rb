class Log < ApplicationRecord
  validates :code, presence: true
  validates :privacy, presence: true
  validates :action, presence: true
  validates :commentary, presence: true
end
