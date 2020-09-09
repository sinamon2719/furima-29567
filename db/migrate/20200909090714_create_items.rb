class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name 
      t.integer :price
      t.text    :content
      t.integer :shipping_cost
      t.integer :shipping_days 
      t.integer :prefecture
      t.integer :judgment
      t.integer :category
      t.integer :user_id 
      t.timestamps
    end
  end
end