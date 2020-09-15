class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :user_items
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :content
    validates :shipping_cost_id
    validates :shipping_day_id
    validates :prefecture_id
    validates :category_id
    validates :judgment_id
  end
  
  validates_inclusion_of :price, in: 300..9_999_999
  with_options presence: true, format: { with: /\A[0-9]+\Z/, message: '半角数字を使用してください' } do
    validates :price
  end

  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :judgment

  validates :category_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :judgment_id, numericality: { other_than: 1 }
end
