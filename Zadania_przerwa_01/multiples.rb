def multiples(input_number)
  result = 0
  range = 0..input_number
  range.each do |el|
    if el % 3 == 0 || el % 5 == 0
      result += el
    end
  end
  puts result
end

multiples(10) #=> 33
multiples(20) #=> 98
