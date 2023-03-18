class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @deliveries = Delivery.where(customer_id: current_customer.id)
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    redirect_to complete_path
  end

  def info
    @info_order = Order.new(order_params)
    if params[:order][:select_residence] == "0"
      @info_order.residence = current_customer.residence
      @info_order.postcode = current_customer.postcode
      @info_order.name = "#{current_customer.last_name + current_customer.first_name}"
    elsif params[:order][:select_residence] == "1"
      @deliveries = Delivery.find(params[:order][:deliveries_id])
      @info_order.postcode = @deliveries.postcode
      @info_order.residence = @deliveries.residence
      @info_order.name = @deliveries.name
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postage, :cash, :postcode, :residence, :name, :total_price, :order_status)
  end

end
