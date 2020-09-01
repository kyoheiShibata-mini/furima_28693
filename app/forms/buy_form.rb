class BuyForm
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal,:prefecture_id,:city,:address,:building,:tel,:token

  #destinationモデルのバリデーション
  POSTAL = /\A\d{3}[-]\d{4}\z/
  TEL = /\A\d{,11}\z/
  with_options presence: true do
    validates :postal, format: { with: POSTAL }
    validates :prefecture_id
    validates :city
    validates :address 
    validates :tel , format: { with: TEL }

    validates :token
  end

  def save
    buy_log = BuyLog.create(user_id: user_id, item_id: item_id)
    Destination.create(buy_log_id: buy_log.id,postal: postal, prefecture_id: prefecture_id,city: city, address: address, building: building, tel: tel)
  end
end