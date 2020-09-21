class UserOrder

  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:city,:address,:building_name,:phone_number,:user_id,:user_item_id,:token,:item_id

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id,numericality: { other_than: 1 }
  validates :phone_number, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10000000000, message: "is out of setting range"}
  with_options presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} do
    validates :post_code
  end
  with_options presence: true, format: {with:/\A\d{11}\z/, message: "unnecessary hyphen(-)"} do
    validates :phone_number
  end
  


  def save
  user_item = UserItem.create(user_id: user_id,item_id: item_id,)
  Order.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, user_item_id: user_item.id)
 end
end
