class AddDeliveryIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_id, :integer, index: true
  end
end
