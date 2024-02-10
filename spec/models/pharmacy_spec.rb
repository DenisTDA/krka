require 'rails_helper'

RSpec.describe Pharmacy, type: :model do
  describe 'associations' do
    it { should belong_to(:adress) }
  end

  describe 'validations' do
    it { should validate_presence_of(:adress) }
  end
end
