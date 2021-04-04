class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/ , message: "is invalid."}
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end