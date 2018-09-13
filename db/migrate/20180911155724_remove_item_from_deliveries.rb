class RemoveItemFromDeliveries < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :item, :text
  end
end
