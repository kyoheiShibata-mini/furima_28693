class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  has_one :buy_log

  belongs_to_active_hash :genre_category
  belongs_to_active_hash :genre_dispatch
  belongs_to_active_hash :genre_fee
  belongs_to_active_hash :genre_place
  belongs_to_active_hash :genre_state

  has_one_attached :image

  validates :image, :name, :explain, :price, :category_id, :state_id, :fee_id, :place_id, :dispatch_id, :user_id, presence: true

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
end
