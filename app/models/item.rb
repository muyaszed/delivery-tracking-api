class Item < ApplicationRecord
  belongs_to :delivery
  validates :descp, presence: true
end
