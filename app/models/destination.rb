class Destination < ApplicationRecord
  belongs_to :buy_log

  with_options presence: true do
    validates :postal
    validates :prefecture_id
    validates :city
    validates :address 
    validates :tel
  end
end