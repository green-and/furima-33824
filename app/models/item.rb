class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :sender_area
  belongs_to :required_time

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    with_options numericality: { other_than: 1 } do
      validates :category_id 
      validates :condition_id
      validates :postage_id
      validates :sender_area_id
      validates :required_time_id
    end
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
