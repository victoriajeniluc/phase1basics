helpers do
  def format_date(date)
    date.strftime("%B %m, %Y")
  end

  def format_month_day(date)
    date.strftime("%B %d")
  end

  def format_time(time)
    time.strftime("%I:%M%p")
  end

  def format_datetimelocal(datetime)
    if datetime
      datetime.strftime("%Y-%m-%dT%H:%M:%S")
    else
      return ""
    end
  end
end
