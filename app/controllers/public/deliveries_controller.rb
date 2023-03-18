class Public::DeliveriesController < ApplicationController

  def index
    @delivery=Delivery.new
    @deliveries=Delivery.all
  end

  def create
    @delivery=Delivery.new(delivery_params)
    if @delivery.save
      redirect_to deliveries_path
    else
      @deliveries=Delivery.all
      render 'index'
    end
  end

  def edit
    @delivery=Delivery.find(params[:id])
  end

  def update
    @delivery=Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path
    else
      render "edit"
    end
  end

  def destroy
    @delivery=Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end


  private

  def delivery_params
    params.require(:delivery).permit(:postcode, :residence, :name, :customer_id)
  end

end
