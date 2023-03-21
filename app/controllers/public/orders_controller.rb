class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @deliveries = Delivery.all
  end

  def create
    @customer = current_customer
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      order_item = OrderItem.new
      order_item.item_id = @cart_item.item_id
      order_item.order_id = @order.id
      order_item.quantity = @cart_item.quantity
      order_item.purchase_price = @cart_item.total_price
      order_item.save
      redirect_to complete_orders_path
      current_customer.cart_items.destroy_all
    end
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
    elsif params[:order][:aselect_residence] == "2"
     @order.postal_code = params[:order]["postcode"]
     @order.address = params[:order]["residence"]
     @order.name = params[:order]["name"]
    end
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
    @order.postage = 800
  end

  def complete
  end


  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postage, :cash, :postcode, :residence, :name, :total_price, :order_status)
  end

end
