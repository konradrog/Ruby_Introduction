def highest_number(number)
  number = number.to_s
  temp = []
  number.each_char {|char| temp << char}
  print temp.sort.reverse.join
  puts
end

highest_number(132)
highest_number(1464)
highest_number(165423) #=> 654321
