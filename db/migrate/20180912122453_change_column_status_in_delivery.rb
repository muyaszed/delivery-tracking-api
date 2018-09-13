class ChangeColumnStatusInDelivery < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :status, :string
    add_column :deliveries, :status, :integer, :default => 0
  end
end
