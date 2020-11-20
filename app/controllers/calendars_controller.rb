class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all.order('created_at DESC')
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to new_calendar_stock_path(@calendar), notice: "#{l @calendar.day, format: :long}の入荷日を登録しました。続けて入荷物を登録してください。"
    else
      render :new
    end
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      redirect_to root_path, notice: "#{l @calendar.day, format: :long}に入荷日を変更しました。"
    else
      render :edit
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to root_path, notice: "#{l @calendar.day, format: :long}を削除しました。"
  end

  private

  def calendar_params
    params.require(:calendar).permit(:day).merge(user_id: current_user.id)
  end
end
