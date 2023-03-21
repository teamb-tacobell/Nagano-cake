class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_status = OrderItem.find(params[:id])
    @order = Order.find(@order_product.order_id)
    @order_statuses = @order.order_products.all
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
