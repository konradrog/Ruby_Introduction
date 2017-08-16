def leap_year?(year)
  if (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)
    true
  else
    false
  end
end


# leap_year?(2004) #=> true
# leap_year?(2000) #=> true
# leap_year?(2100) #=> false
