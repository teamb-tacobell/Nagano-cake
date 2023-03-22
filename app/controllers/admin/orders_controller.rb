class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @order_items = OrderItem.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:postage, :cash, :name, :postcode, :residence, :order_status)
  end

end
