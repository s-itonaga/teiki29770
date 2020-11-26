class ProductsController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @produsts = @customer.products
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @product = Product.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @product = @customer.products.new(product_params)
    if @product.save
      redirect_to edit_customer_path(@customer), notice: "#{@customer.name}様の取置商品を登録しました。"
    else
      render :new
    end
  end
  private

  def product_params
    params.require(:product).permit(:name, :z_code, :num, :release).merge(customer_id: @customer.id)
  end
end
