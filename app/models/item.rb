class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :sender_area
  belongs_to :required_time

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :postage_id, presence: true, numericality: { other_than: 1 }
  validates :sender_area_id, presence: true, numericality: { other_than: 1 }
  validates :required_time_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
