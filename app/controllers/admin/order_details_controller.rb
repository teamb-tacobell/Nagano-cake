class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(item_params)

#    if @order_item.production_status == OrderItem.production_statuses.key(2)
#      @order.order_status = Order.order_statuses.key(2)
#      @order.save
#    end

    redirect_to admin_order_path(@order_item.order_id)
  end

  private

  def item_params
    params.require(:order_item).permit(:production_status)
  end

end
