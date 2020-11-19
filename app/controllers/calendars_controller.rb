class CalendarsController < ApplicationController
  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to root_path, notice: "#{@calendar.day}の入荷日を登録しました。"
    else
      render :new
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:day).merge(user_id: current_user.id)
  end
end
