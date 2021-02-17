class OrderAddress
  include ActiveModel::Model
  attr_accessor :address_number, :prefecture_id, :city, :house_number, :building, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :address_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :tel, format: { with: /\A[0-9]+\z/, message: 'is only numbers' }
    validates :user_id
    validates :item_id
    validates :token
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(address_number: address_number, prefecture_id: prefecture_id, city: city,
                             house_number: house_number, building: building, tel: tel, order_id: order.id)
  end
end
