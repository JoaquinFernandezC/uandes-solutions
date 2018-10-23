class IicDocument < ApplicationRecord
  belongs_to :iic
  belongs_to :document, dependent: :delete
end
