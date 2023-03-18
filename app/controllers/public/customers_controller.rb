class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "登録情報の編集が成功しました"
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end
  
  def quit_check
    
  end
  
  def quit
  
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :residence, :phone_number, :is_deleted)
  end
end
