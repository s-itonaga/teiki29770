class ProductsController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @products = @customer.products.all.order('created_at DESC')
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

  def edit
    @customer = Customer.find(params[:customer_id])
    @product = @customer.products.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @product = @customer.products.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path, notice: "#{@customer.name}様の取置商品を編集しました。"
    else
      render :edit
    end
  end

  def csv_import
    @customer = Customer.find(params[:customer_id])
    Product.csv_import(params[:file], params[:customer_id])
    redirect_to root_path, notice: "#{@customer.name}様の取り置き商品を一括登録しました。"
  end

  private

  def product_params
    params.require(:product).permit(:name, :z_code, :num, :release).merge(customer_id: @customer.id)
  end
end
