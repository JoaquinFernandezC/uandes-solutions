class DerivationTaskDocument < ApplicationRecord
  belongs_to :derivation_task
  belongs_to :document
end
