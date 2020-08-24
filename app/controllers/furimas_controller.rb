class FurimasController < ApplicationController
  def index
    @items = Item.all.order(id: "DESC")

  end

  def new 
    @item = Item.new
  end

  def create
    @item =  Item.new(item_params)
    buy_log = BuyLog.new()
    buy_log.item_id = @item.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
end

private

def item_params
  params.require(:item).permit(:image, :name, :explain, :price, :category_id, :state_id, :fee_id, :place_id, :dispatch_id).merge(user_id: current_user.id)
end