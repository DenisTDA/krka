require 'rails_helper'

RSpec.describe Adress, type: :model do
  describe 'associations' do
#    it { should belong_to(:category).class_name('MenuCategory') }
  end

  describe 'validations' do
    it { should validate_presence_of(:building) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:street) }
  end
end
