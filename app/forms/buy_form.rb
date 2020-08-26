class BuyForm

  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal,:prefecture_id,:city,:address,:building,:tel

  #destinationモデルのバリデーション
  with_options presence: true do
    validates :postal
    validates :prefecture_id
    validates :city
    validates :address
    validates :tel
  end

  def save
    buy_log = BuyLog.create(user_id: user_id, item_id: item_id)
    Destination.create(buy_log_id: buy_log.id,postal: postal, prefecture_id: prefecture_id,city: city, address: address, building: building, tel: tel)
  end
end