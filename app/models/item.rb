class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  has_one :buy_log

  belongs_to_active_hash :category
  belongs_to_active_hash :dispatch
  belongs_to_active_hash :fee
  belongs_to_active_hash :place
  belongs_to_active_hash :state

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
  
  def previous
    Item.where("id < ?",id).order("id DESC")
  end

  def next
    Item.where("id > ?", id).order("id ASC")
  end
end
