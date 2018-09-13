require 'rails_helper'

RSpec.describe Delivery, type: :model do
  let(:delivery) {Delivery.create()}
  it { should belong_to(:user)}
  it { should have_many(:items)}
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:tracking_number) }
  it { should validate_presence_of(:customer_first_name) }
  it { should validate_presence_of(:customer_last_name) }
  it { should validate_presence_of(:customer_email) }
  it 'should have default status' do
    expect(delivery.status).to eq("Pending")
  end
end
