class CustomersController < ApplicationController
  def index
    @customers = Customer.all.order('created_at DESC')
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

  def edit
    @customer = Customer.find(params[:id])
  end


  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :phone_number, :note1, :note2).merge(user_id: current_user.id)
  end
end
