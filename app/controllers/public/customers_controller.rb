class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報の編集が成功しました"
      redirect_to customer_path
    else
      render :edit
    end
  end

  def quit_check
    @customer = current_customer
  end

  def quit
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了しました。ご利用ありがとうございました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :residence, :phone_number, :is_deleted)
  end
end
