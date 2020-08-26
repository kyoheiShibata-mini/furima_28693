class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if  !user_signed_in?
      redirect_to new_user_session_path
    elsif @item.buy_log || @item.user.id == current_user.id
      redirect_to root_path
    end
    @buy_form = BuyForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new(buy_form_params)
    if @buy_form.valid?
      @buy_form.save
      #pay_item
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_form_params
    params.require(:buy_form).permit(:postal,:prefecture_id,:city,:address,:building,:tel).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_d6b63e3f23a8aa8679e78fc2"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end 
end
