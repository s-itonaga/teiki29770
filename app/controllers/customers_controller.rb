class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :phone_number, :note1, :note2).merge(user_id: current_user.id)
  end
end
