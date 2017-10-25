helpers do
  def format_date(date)
    date.strftime("%B %m, %Y")
  end

  def format_month_day(date)
    date.strftime("%B %d")
  end

  def format_time(time)
    time.strftime("%I:%M")
  end
end
