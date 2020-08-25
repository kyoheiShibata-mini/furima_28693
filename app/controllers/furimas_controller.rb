class FurimasController < ApplicationController
  def index
    @items = Item.all.order(id: "DESC")

  end
end
