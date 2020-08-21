class Item < ApplicationRecord
  belongs_to_active_hash :genre_category
  belongs_to_active_hash :genre_dispatch
  belongs_to_active_hash :genre_fee
  belongs_to_active_hash :genre_place
  belongs_to_active_hash :genre_state

  validates 
end
