def sum_array(array)
  array.delete(array.min)
  array.delete(array.max)
  puts array.inject(0) { |acc, el| acc + el}
end

sum_array([1, 2, 3, 4])
sum_array([12, 4, 0, -8])
sum_array([12, 4])
sum_array([120, 7, 145, -10, -15])
