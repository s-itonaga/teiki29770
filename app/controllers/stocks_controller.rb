class StocksController < ApplicationController
  def index
    @calendar = Calendar.find(params[:calendar_id])
    @stocks = @calendar.stocks
    @products = Product.all
  end

  def new
    @calendar = Calendar.find(params[:calendar_id])
  end

  def csv_import
    @calendar = Calendar.find(params[:calendar_id])
    Stock.csv_import(params[:file], params[:calendar_id])
    redirect_to root_path, notice: "#{l @calendar.day, format: :long}の入荷物を登録しました。"
  end
end
