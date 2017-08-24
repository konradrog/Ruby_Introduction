def to_roman(input_number)
  temp = []
  counter = 0
  symbols = [["I", "V",  "X"], ["X", "L", "C"], ["C", "D", "M"], ["M", "D"]]
  result = ""
  input_number = input_number.to_s.reverse
  while counter < input_number.size
    case input_number[counter]
    when "1"
      result << symbols[counter][0]
    when "2"
      result << symbols[counter][0] + symbols[counter][0]
    when "3"
      result << symbols[counter][0] + symbols[counter][0] + symbols[counter][0]
    when "4"
      result << symbols[counter][1] + symbols[counter][0]
    when "5"
      result << symbols[counter][1]
    when "6"
      result << symbols[counter][0] + symbols[counter][1]
    when "7"
      result << symbols[counter][0] + symbols[counter][0] + symbols[counter][1]
    when "8"
      result << symbols[counter][0] + symbols[counter][0] + symbols[counter][0] + symbols[counter][1]
    when "9"
      result << symbols[counter][2] + symbols[counter][0]
    end
    counter += 1
  end

  result.reverse
end

puts to_roman(5)#=> 'V'
puts to_roman(37) #=> 'XXXVII'
puts to_roman(924) #=> 'CMXXIV'
puts to_roman(2999)
