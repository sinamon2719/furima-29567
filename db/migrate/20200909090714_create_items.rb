class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :price
      t.text    :content
      t.integer :shipping_cost_id
      t.integer :shipping_day_id
      t.integer :prefecture_id
      t.integer :judgment_id
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end