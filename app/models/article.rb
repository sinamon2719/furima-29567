class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :judgment

  validates :category,:shipping_cost,:shipping_day,:prefecture,:judgment , presence: true
  validates :category_id, :shipping_cost_id,:shipping_day_id,:prefecture_id,:judgment_id, numericality:{ other_than: 1 } 
end
