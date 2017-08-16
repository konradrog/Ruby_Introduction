require "./leap_year.rb"

def leap_years(years)
  result = []
  years.map do |y|
    if leap_year?(y)
      result << y
    end
  end
  result
end
#
leap_years([2011, 2012, 2015, 2016, 2018]) #=> [2012, 2016]
leap_years((2000..2100).to_a)
