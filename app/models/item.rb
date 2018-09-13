class Item < ApplicationRecord
  belongs_to :delivery
  validates_presence_of :descp
end
