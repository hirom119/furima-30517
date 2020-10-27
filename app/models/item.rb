class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :status
  belongs_to :user


  validates :category_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :day_id
    validates :prefecture_id
    validates :shipping_charge_id
    validates :status_id
    validates :price
  end
end