class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :status
  belongs_to :user
  has_one :order

  with_options numericality: {other_than:1} do validates :shipping_charge_id
    validates :category_id
    validates :day_id
    validates :prefecture_id
    validates :shipping_charge_id
    validates :status_id
  end
  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :category_id
    validates :day_id
    validates :prefecture_id
    validates :shipping_charge_id
    validates :status_id
    validates :price
  end
  validates :price, numericality: { with: /\A[0-9]+\z/ , greater_than: 299, less_than:10000000}
end