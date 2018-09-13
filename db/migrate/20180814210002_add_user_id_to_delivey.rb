class AddUserIdToDelivey < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :user_id, :integer, index: true
  end
end
