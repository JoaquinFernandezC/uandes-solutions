class Case < ApplicationRecord
  belongs_to :regional_pros_office
  belongs_to :ruc_felony
  belongs_to :prosecutor
end
