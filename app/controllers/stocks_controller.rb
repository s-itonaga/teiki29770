class StocksController < ApplicationController
  
  def index
    @calendar = Calendar.find(params[:calendar_id])
    @stocks = @calendar.stocks
  end

  def new
    @calendar = Calendar.find(params[:calendar_id])
  end

  def import
    @calendar = Calendar.find(params[:calendar_id])
    Stock.import(params[:file],params[:calendar_id])
    redirect_to root_path, notice: "#{l @calendar.day, format: :long}の入荷物を登録しました。" 
  end
end
