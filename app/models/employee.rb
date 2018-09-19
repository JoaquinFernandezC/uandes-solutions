class Employee < ApplicationRecord
  belongs_to :person
  belongs_to :institution
end
