class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :potcode, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode
    validates :municipality
    validates :address
    validates :phone_number
    validates :purchase_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, municipality: municipality, address: address, phone_number: phone_number, purchase_id: purchase_id)
  end
end