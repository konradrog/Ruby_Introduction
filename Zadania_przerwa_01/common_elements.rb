def common_elements(first_array, second_array)
  result = []
  first_array.each do |el|
    second_array.each do |e|
      if el == e
        result << e
      end
    end
  end
  print result
  puts
end

common_elements([1, 2, 3, 4, 5], [4, 5, 6])
common_elements(['a', 'b', 'c', 'd'], ['c','d', 'e'])
common_elements([14, 'apple', 1227, 'cat'], ['cat', 166, 541, 1227])
