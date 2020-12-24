class StocksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @calendar = Calendar.find(params[:calendar_id])
    @stocks = @calendar.stocks.where("num > ?",0).order("#{sort_column} #{sort_direction}").page(params[:page])
    @products = Product.all
  end

  def search
    @q = Stock.search(search_params)
    @stocks = @q.result.includes(:calendar).order("#{sort_column} #{sort_direction}").page(params[:page])
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

  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Stock.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def search_params
    params.require(:q).permit!
  end

end
