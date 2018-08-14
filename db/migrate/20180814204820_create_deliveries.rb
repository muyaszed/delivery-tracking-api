class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.text :item, array: true, default: [], null: false
      t.string :status

      t.timestamps
    end
  end
end
