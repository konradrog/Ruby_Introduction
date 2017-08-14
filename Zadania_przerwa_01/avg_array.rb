def avg_array(*arrays)
  mean = []
  counter = 0
  counter2 = 0
  puts size = arrays.size
  size_of_single = arrays[0].size
  while counter < size_of_single
    sum = 0.0
    arrays.each do |el|
      sum += el[counter2]
    end
    mean << sum / size
    counter += 1
    counter2 += 1
  end
  print mean
  puts
end

avg_array([1, 3, 5], [3, 5, 7])
avg_array([1, 5, 3, 22], [12, 22, 13, 5], [5, 12, 24, 5], [14, 40, 5, 17])
