class Birthday
  YEAR = 365
  attr_accessor :date
  def initialize(date)
    @date = date
  end

  def today? 
    birth_day == today_day && birth_month == today_month
  end

  def message
    today? ? "Happy Birthday, you are #{age} today" : "It's not your birthday yet."
  end

  def days_until
    if today_month == birth_month && today_day < birth_day
      return "It's in #{birth_day.to_i - today_day.to_i} days!"
    elsif today_month == birth_month && today_day > birth_day
      return "It's in #{YEAR - (today_day.to_i - birth_day.to_i)} days!"
    else 
      "And it's not in this month anyway!"
    end
  end



  private

  def age 
    today_year - birth_year
  end

  def birth_day
    date = @date.split("-")
    date[-1]
  end

  def birth_month
    date = @date.split("-")
    date[-2]
  end

  def birth_year
    date = @date.split("-")
    date[0].to_i
  end

  def today_day
    Time.new.strftime("%d")
  end

  def today_month
    Time.new.strftime("%m")
  end

  def today_year
    Time.new.strftime("%Y").to_i
  end
end
