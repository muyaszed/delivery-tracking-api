class Delivery < ApplicationRecord
  belongs_to :user
  has_many :items
  validates_presence_of :status, :customer_first_name, :customer_last_name, :customer_email, :tracking_number

  enum status: {Pending: 0, Shipped: 1, Arrived: 2}
end
