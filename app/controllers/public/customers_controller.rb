class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.find(params[:id])
  end
  
  def edit
    @customers = Customer.find(params[:id])
  end
  
  def update
    
  end
  
  def quit_check
    
  end
  
  def quit
  
  end
end
