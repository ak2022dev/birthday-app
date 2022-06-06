require 'date'

# Tested on 2022/"June"/6
# birth_date_counter( "June", "6" ) => 0 (as expected)
# birth_date_counter( "June", "7" ) => 1 (as expected)
# birth_date_counter( "June", "8" ) => 2 (as expected)
# birth_date_counter( "June", "5" ) => 364 (as expected)
# birth_date_counter( "June", "4" ) => 363 (as expected)

def birth_date_counter( month_name, day )
  # month_name and day are initially in string format
  # returns number of days from today until birthday or -1 if error
  # convert and create new Date object
  month = Date::MONTHNAMES.index( month_name.strip )
  today = Date.today
  if !(Date.valid_date?( today.year, month, (day.strip).to_i ))
    # error condition
    return -1
  end
  birthday = Date.new( today.year, month, (day.strip).to_i )
  if (today <=> birthday) == 0
    # today is birthday
    return 0
  elsif (today <=> birthday) == -1
    # today is before birthday
    # return number of days until birthday this year
    return (birthday - today).to_i
  elsif (today <=> birthday) == 1
    # today is after birthday
    # return number of days until birthday next year
    # i.e. number of days from today until new year plus
    # number of days from new year until birthday
    return ((Date.new( (today.year)+1, 1, 1) - today) + (Date.new( (today.year)+1, birthday.month, (day.strip).to_i ) - (Date.new( (today.year)+1, 1, 1)))).to_i 
  else
    # return error condition -1
    return -1
  end
end
