class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update,:destroy]

  def show
    @comments = @item.comments.sort.reverse

    @comment = Comment.new
  end

  def edit
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      render :show
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
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
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
