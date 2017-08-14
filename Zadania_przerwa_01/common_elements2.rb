def common_elements(first_array, second_array)
  result = []
  first_array.each do |el|
    if second_array.include?(el)
      result << el
    end
  end
  print result
  puts
end

common_elements([1, 2, 3, 4, 5], [4, 5, 6])
common_elements(['a', 'b', 'c', 'd'], ['c','d', 'e'])
common_elements([14, 'apple', 1227, 'cat'], ['cat', 166, 541, 1227])
