require 'rails_helper'

RSpec.describe Delivery, type: :model do
  it { should belong_to(:user)}

  it { should validate_presence_of(:item) }
  it { should validate_presence_of(:status) }

end
