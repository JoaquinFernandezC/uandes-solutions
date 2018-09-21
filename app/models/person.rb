class Person < ApplicationRecord
  validates :name, presence: true
  validates :rut, presence: true
  validates :passport, presence: true

  has_many :authors
  has_many :aliases
  has_many :cc_inv_leg_people

  has_one :employee
  has_one :institution, through: :employee
  has_one :petitioner
  has_one :report_receiver_people
  has_one :derivation, through: :report_receiver_people
end
