class Adress < ApplicationRecord
  has_many :pharmacies

  validates_presence_of :building, :city, :street
end

