class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_item_id
      t.string  :post_code
      t.integer :prefecture
      t.string  :city
      t.string  :address
      t.string  :building_name
      t.string  :phone_number
      t.timestamps
    end
  end
end