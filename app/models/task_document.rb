class TaskDocument < ApplicationRecord
  belongs_to :task
  belongs_to :document
end
