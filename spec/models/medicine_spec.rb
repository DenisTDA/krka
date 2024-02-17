require 'rails_helper'

RSpec.describe Medicine, type: :model do
  it {should validate_presence_of(:title)}
end
