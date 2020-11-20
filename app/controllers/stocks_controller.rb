class StocksController < ApplicationController
  
  def index
    @calendar = Calendar.find(params[:calendar_id])
    @stocks = @calendar.stocks
  end

  def new
    @calendar = Calendar.find(params[:calendar_id])
  end

  def import
    Stock.import(params[:file],params[:calendar_id])
    redirect_to root_path, notice: "Crops imported." 
  end
end
