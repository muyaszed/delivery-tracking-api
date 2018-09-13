require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:delivery)}
  it { should validate_presence_of(:descp) }
end
