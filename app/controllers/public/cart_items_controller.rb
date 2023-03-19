class Public::CartItemsController < ApplicationController

  # def new
    # @cart_item=CartItem.new
  # end

  def index
    @cart_item=CartItem.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
