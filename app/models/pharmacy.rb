class Pharmacy < ApplicationRecord
  belongs_to :adress, required: true
  has_one :head, class_name: "Person"

  validates_presence_of :adress
end
