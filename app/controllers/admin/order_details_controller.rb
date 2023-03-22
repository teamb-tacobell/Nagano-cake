class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_params)
    redirect_to admin_order_path(@order_item.order_id)
  end

  private

  def order_params
    params.require(:order_item).permit(:production_status)
  end

end
