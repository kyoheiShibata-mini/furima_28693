class FurimasController < ApplicationController
  def index
  end

  def new 
    @item = Item.new
  end

  def create
    @item =  Item.new(item_params)
    if @item.save
      redirect_to root_path
    end
    render :new
  end
  
end

private

def item_params
  params.require(:item).permit(:image, :name, :explain, :price, :category_id, :state_id, :fee_id, :place_id, :dispatch_id)
end