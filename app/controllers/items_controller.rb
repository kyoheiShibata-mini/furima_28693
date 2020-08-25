class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  
  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(item.id)
    else
      render :edit
    end
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :price, :category_id, :state_id, :fee_id, :place_id, :dispatch_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
