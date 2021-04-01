class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :potcode, :sender_area_id, :municipality, :address, :building_name, :phone_number, :purchase_id
  #都道府県の部分はすでにActiveHashを作成しているsender_areaのデータを取り込む

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode
    validates :sender_area_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :purchase_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture: sender_area_id, municipality: municipality, address: address, phone_number: phone_number, purchase_id: purchase_id)
    #都道府県の部分はすでにActiveHashを作成しているsender_areaのデータを取り込む
  end
end