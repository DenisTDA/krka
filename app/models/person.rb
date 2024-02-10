class Person < ApplicationRecord
  belongs_to :pharmacy

  validates_presence_of :name, :lastname
end
