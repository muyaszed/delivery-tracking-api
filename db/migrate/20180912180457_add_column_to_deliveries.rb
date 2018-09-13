class AddColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :tracking_number, :string
    add_column :deliveries, :customer_first_name, :string
    add_column :deliveries, :customer_last_name, :string
    add_column :deliveries, :customer_email, :string
  end
end
