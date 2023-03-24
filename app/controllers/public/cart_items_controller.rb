class Public::CartItemsController < ApplicationController
   before_action :authenticate_customer!

  # def new
    # @cart_item=CartItem.new
  # end

  def index
    @cart_items=current_customer.cart_items
  end

  def create
    @cart_item=current_customer.cart_items.new(cart_item_params)
    if @cart_item.quantity==0
      flash[:notice]="数量を選択してください"
      redirect_to item_path(@cart_item.item.id)
    else
      @cart_items=current_customer.cart_items.all
      @cart_items.each do |cart_item|
        if cart_item.item_id==@cart_item.item_id
          new_quantity=cart_item.quantity+@cart_item.quantity
          cart_item.update_attribute(:quantity,new_quantity)
          @cart_item.delete
        end
      end
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_item=CartItem.where(customer_id:current_customer.id)
    @cart_item.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity,:item_id)
  end

end
