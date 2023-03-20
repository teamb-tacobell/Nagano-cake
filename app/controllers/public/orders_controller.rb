class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @deliveries = Delivery.all
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @customer = current_customer
    @order.save
    redirect_to complete_orders_path
  end

  def info
    @order = Order.new(order_params)
    if params[:order][:select_residence] == "0"
      @order.residence = current_customer.residence
      @order.postcode = current_customer.postcode
      @order.name = "#{current_customer.last_name + current_customer.first_name}"
    elsif params[:order][:select_residence] == "1"
      @deliveries = Delivery.find(params[:order]["deliveries_id"])
      @order.postcode = @deliveries.postcode
      @order.residence = @deliveries.residence
      @order.name = @deliveries.name
    end

    @cart_items = CartItem.all
    @sum_of_items_price = @cart_items.inject(0) { |sum, item| sum + item.quantity }
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postage, :cash, :postcode, :residence, :name, :total_price, :order_status)
  end

end
