class Item < ApplicationRecord
  has_many :user_items
  belongs_to :user
end
