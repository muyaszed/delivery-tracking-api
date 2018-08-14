class Delivery < ApplicationRecord
  belongs_to :user
  validates_presence_of :item, :status
end
