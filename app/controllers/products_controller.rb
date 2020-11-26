class ProductsController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @produsts = @customer.products
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @product 
  end

  def create
  end
end
