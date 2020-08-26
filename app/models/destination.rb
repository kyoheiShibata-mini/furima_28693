class Destination < ApplicationRecord
  belongs_to :buy_log

  with_options presence: true do
    validates :postal
    validates :prefecture_id
    validates :city
    validates :address , format: { with: /^\d]{3}[-]\d[4]$/ }
    validates :tel , format: { with: /^\d]{,11}$/ }
  end
end