def sum_array(array)
  result =  array.inject(0) { |acc, el| acc + el}
  result -= array.min + array.max
end

puts sum_array([1, 2, 3, 4])
puts sum_array([12, 4, 0, -8])
puts sum_array([12, 4])
puts sum_array([120, 7, 145, -10, -15])
