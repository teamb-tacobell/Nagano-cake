# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
    def customer_state
      @customer = Customer.find_by(email: params[:customer][:email])
      return if !@customer
      if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted == true
        flash[:notice] = "退会済みの為、再登録が必要です。"
        redirect_to new_customer_registration_path
      end
    end
end
