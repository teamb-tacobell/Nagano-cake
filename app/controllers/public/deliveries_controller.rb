class Public::DeliveriesController < ApplicationController

  def index
    @delivery=Delivery.new
    # @deliveries=current_customer.deliveries.page(params[:page])
    @deliveries=current_customer.deliveries
  end

  def create
    @delivery=current_customer.deliveries.new(delivery_params)
    if @delivery.save
      flash[:notice]="登録完了しました"
      redirect_to deliveries_path
    else
      @deliveries=current_customer.deliveries.all
      render "index"
    end
  end

  def edit
    @delivery=Delivery.find(params[:id])
  end

  def update
    @delivery=Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      flash[:notice]="登録情報変更しました"
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
    params.require(:delivery).permit(:postcode, :residence, :name)
  end

end
