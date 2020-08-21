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

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :price, numericality: { only_integer: true, 
                                      greater_than: 299, 
                                      less_than: 10000000 }
    validates :category_id
    validates :state_id
    validates :fee_id
    validates :place_id
    validates :dispatch_id
    validates :user_id
  end
  
end
