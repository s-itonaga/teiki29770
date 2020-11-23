module CalendarsHelper
  def wday_color(calendar)
    if calendar.day.wday == 0
      return 'red'
    elsif calendar.day.wday == 6
      return 'blue'
    else
      return 'gray'
    end
  end  
end
