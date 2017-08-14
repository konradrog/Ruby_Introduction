def avg_array(first_array, second_array)
  # if first_array.size != second_array.size
  #   puts "Arrays are not the same size"
  #   break
  # end

  mean = []
  counter = 0
  while counter < first_array.size
    sum = first_array[counter] + second_array[counter]
    mean << sum / 2
    counter += 1
  end
  print mean
  puts
end

avg_array([1, 3, 5], [3, 5, 7])
avg_array([1, 5, 3, 22], [12, 22, 13, 5], [5, 12, 24, 5], [14, 40, 5, 17])
