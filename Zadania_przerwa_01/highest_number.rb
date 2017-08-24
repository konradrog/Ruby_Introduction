def highest_number(number)
  temp = []
  number = number.to_s
  number.each_char {|char| temp << char}
  if number[0] == "-"
    result = temp.sort.join.to_i
  else
    result = temp.sort.reverse.join.to_i
  end
end

puts highest_number(132)
puts highest_number(1464)
puts highest_number(165423) #=> 654321
puts highest_number(-165423)
